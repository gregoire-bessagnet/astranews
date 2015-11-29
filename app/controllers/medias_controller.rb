class MediasController < ApplicationController

  before_filter :authenticate_user!
  before_action :set_post, only: [:show, :new, :create]


   def show
    @media = Media.find(params[:id])
  end

  def index
    @medias = Media.all
  end

  def create
    @media = @post.media.new(media_params)
    @media.user = current_user
    if @media.save
      redirect_to new_post_media_path
    else
      render 'medias/show'
    end
  end

  def new
    @media = Media.new
  end

  def edit
  end

  def update
  end

  def destroy
    @media.destroy
    redirect_to medias_path
  end

  private

    def set_post
    @post = Post.find(params[:post_id])
  end

  def media_params
    params.require(:media).permit(:description, :photo, :post_id)
  end

end


