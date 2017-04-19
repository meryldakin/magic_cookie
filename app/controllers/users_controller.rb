class UsersController < ApplicationController

  def index
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
      redirect_to user_path(@user)
      # redirect_to user_path(@user)
    else
      # flash[:notice] = "Sorry, you must enter all the fields!"
      redirect_to home_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
