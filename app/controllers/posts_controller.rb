class PostsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = current_user.posts.find(params[:id])
  end

  def create

    @post = Post.new(post_params)
    @post.user_id = current_user.id
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
    if @post.update_attributes(post_params)
      redirect_to @post
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to :posts
  end

private

  def post_params
    params.require(:post).permit(:title, :image, :user_id,:body, documents_files: [])
  end
end
