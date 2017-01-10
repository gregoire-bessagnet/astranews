class PostsController < ApplicationController

  before_filter :authenticate_user!, except: [:index, :show]
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = policy_scope(Post).includes(:favs)
    if params[:search] and not params[:search][:query].blank?
      @posts = @posts.search params[:search][:query]
    end
  end

  def show
    @alert_message = "Vous lisez #{@post.title}"
    @post = Post.find(params[:id])
    authorize @post
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
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to :back
  end

  private

  def find_post
    @post = Post.find(params[:id])
    authorize @post
  end

  def post_params
    params.require(:post).permit(:title, :introduction, :content, :status, :synopsis, :city, :category, :licence, :cover, :price)

  end
end
