class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?, :require_login, :current_user

  def logged_in?
    session[:user_id].present?
  end

  def require_login
    redirect_to home_path unless logged_in?
  end

  def current_user
    User.find(session[:user_id])
  end

end
