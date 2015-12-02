class FavsController < ApplicationController

  def index
    @favs = current_user.favs.all
  end

  def create
    @fav = current_user.favs.new(post: @post)
    @fav.save
    redirect_to :back
  end

  def destroy
    @fav = Fav.find(params[:id])
    @fav.destroy
    redirect_to :back
  end
end

