class MediasController < ApplicationController

  before_action :find_media, only: [:show, :destroy]

  def index
    @medias = Media.all
  end

  def create
  end

  def new
    @media = Media.new
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
    @media = Media.find(params[:id])

  end

  def post_params
    params.require(:media).permit(:description, :photo, :post_id)
  end

end
