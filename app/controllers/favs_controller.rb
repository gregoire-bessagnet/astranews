class FavsController < ApplicationController

  def index
    @favs = policy_scope(Fav).where(user: current_user)
  end

  def create
    @post = Post.find(params[:post_id])
    @fav = current_user.favs.new(post: @post)
    authorize @fav
    if not @post.favs.where(user: current_user).take
      @fav.save
    end
    redirect_to :back
  end

  def destroy
    @fav = Fav.find(params[:id])
    authorize @fav
    @fav.destroy
    redirect_to :back
  end
end

