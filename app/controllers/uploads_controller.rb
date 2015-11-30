class UploadsController < ApplicationController

  before_filter :authenticate_user!
  before_action :set_post, only: [:show, :new, :create]

   def show
    @upload = Upload.find(params[:id])
  end

  def index
    @uploads = Upload.all
  end

  def create
    @upload = Upload.new(upload_params)
    authorize @upload
    if @upload.save
      redirect_to post_upload_path
    else
      render 'uploads/show'
    end
  end

  def new
    @upload = Upload.new
    authorize @upload
  end

  def edit
  end

  def update
  end

  def destroy
    @upload.destroy
    redirect_to uploads_path
  end

  private

    def set_post
    @post = Post.find(params[:post_id])
  end

  def upload_params
    params.require(:upload).permit(:description, :photo, :post_id)
  end
end


