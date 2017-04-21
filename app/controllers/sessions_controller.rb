class SessionsController < ApplicationController
  def index
    if session[:user_id]
      redirect_to user_path(current_user)
    end
  end

  def new

  end

  def create
    @user = User.find_by(username: params[:username])
    if @user.present? && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      session[:ready] = false
      redirect_to user_path(@user)
    else
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to home_path
  end

end
