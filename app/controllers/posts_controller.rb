class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:user)
  end

  private
  def post_params
    params.require(:post).permit(:text, :title, :image, :author, :introduction).merge(user_id: current_user.id)
  end

  def correct_user
    post = Post.find(params[:id])
    if current_user.id != post.user_id
      redirect_to posts_path
    end
  end

end
