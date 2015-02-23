class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'User was successfully created.'
    end
  end

  def index
    @users = User.all
  end

private
  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
