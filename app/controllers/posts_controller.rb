class PostsController < ApplicationController

before_filter :authenticate_user!, except: [:index, :show, :new, :create]
before_action :find_post, only: [:index, :show, :destroy]


  def index
     @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
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
    @post = Post.find(params[:user])

  end

  def post_params
    params.require(:post).permit(:title, :introduction, :content, :synopsis, :city, :category, :price, :licence)
  end

end

