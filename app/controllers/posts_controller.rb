class PostsController < ApplicationController

before_filter :authenticate_user!, except: [:index, :show, :new, :create]
before_action :find_post, only: [ :show, :edit, :update, :destroy]


  def index
     @posts = policy_scope(Post)
  end

  def show
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create

    @post = current_user.posts.new(post_params)
    authorize @post
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
    authorize @post
  end

  def post_params
    params.require(:post).permit(:title, :introduction, :content, :status, :synopsis, :city, :category, :price, :licence)

  end

end

