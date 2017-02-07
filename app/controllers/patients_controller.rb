class PatientsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @patient = Patient.all
  end

  def new
    @patient = Patient.new
  end

  def show
    @patient = current_user.patients.find(params[:id])
  end

  def create
    @patient = Patient.new(patients_params)
    @patient.user_id = current_user.id
    if @patient.save
      redirect_to @patient
    else
      render :new
    end
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update_attributes(post_params)
      redirect_to @patient
    else
      render :new
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy
    redirect_to :patients
  end

private

  def patients_params
    params.require(:patient).permit(:title, :image, :user_id,:dob, documents_files: [])
  end
end
