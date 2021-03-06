class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  def index
    session[:ready] = false
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    @user.current_score = 0
    @user.cumulative_score = 0

    if @user.save
      session[:user_id] = @user.id
      session[:ready] = false
      redirect_to user_path(@user)
    else
      redirect_to home_path
    end
  end

  def show
    session[:ready] = false
    @user = User.find(params[:id])
  end

  def edit
    session[:ready] = false
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :favorite_fortune)
  end
end
