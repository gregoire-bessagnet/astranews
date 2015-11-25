class PostsController < ApplicationController

before_filter :authenticate_user!, except: [:index, :show, :new, :create]
before_action :find_post, only: [ :show, :edit, :update, :destroy]


  def index
     @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :introduction, :content, :status, :synopsis, :city, :category, :price, :licence)
  end

end

