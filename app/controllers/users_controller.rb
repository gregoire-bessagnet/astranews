class UsersController < ApplicationController

  before_filter :authenticate_user!, except: [:index]

  def index
    @users = policy_scope(User)
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

end
