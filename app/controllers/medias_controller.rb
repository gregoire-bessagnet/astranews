class MediasController < ApplicationController

  before_action only: [:show, :destroy, :new]

  def index
    @medias = policy_scope(Media)
    @medias = Media.all
  end

  def create
    @media = current_user.posts.medias.new(post_params)
    authorize @media
    if @media.save
      redirect_to media_path(@media)
    else
      render :new
    end
  end

  def new
    @media = Media.new
    authorize @media
  end

  def show
    @media = Media.find(params[:id])
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

  def find_media
    @media = Media.find(params[:media_id])
    authorize @media
  end

  def post_params
    params.require(:media).permit(:description, :photo, :post_id)
  end
end


