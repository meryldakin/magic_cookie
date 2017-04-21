class StaticPagesController < ApplicationController

  def home
    session[:ready] = false
    if session[:user_id]
      redirect_to user_path(current_user)
    end
  end

  def about
    session[:ready] = false
  end

  def ready
    session[:ready] = true
  end
end
