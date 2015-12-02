class PagesController < ApplicationController

  skip_after_action :verify_authorized
  skip_before_action :authenticate_user!

  def home

    @posts = Post.limit(9)
  end

end
