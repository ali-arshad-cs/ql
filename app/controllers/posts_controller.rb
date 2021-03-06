class PostsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @posts = Post.all.order(created_at: :desc).paginate(page: params[:page],per_page: 30).search(params[:search])
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(patients_params)

    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(patients_params)
      flash[:notice] = 'QC LOG was successfully updated.'
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to :posts
  end



private

  def patients_params
    params.require(:post).permit(:date, :image,:description, :user_id,:overtime ,:qc_done, documents_files: [])
  end



end