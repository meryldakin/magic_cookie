class UsersController < ApplicationController
  def index
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
  end

  def edit
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
