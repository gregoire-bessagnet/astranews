class PagesController < ApplicationController

  skip_after_action :verify_authorized
  skip_before_action :authenticate_user!

  def home
  end

end
