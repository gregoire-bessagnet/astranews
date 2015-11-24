class UserController < ApplicationController

  before_filter :authenticate_user!, except: [:index]
  before_action :set_user, only: [:show, :destroy]

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find
  end

  def edit
  end

  def update
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone_number, :address , :availibility)

  end

  def set_user
    @user = User.find(params[:id])
  end
end
