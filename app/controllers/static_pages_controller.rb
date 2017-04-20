class StaticPagesController < ApplicationController

  def home
    if session[:user_id]
      redirect_to user_path(User.find(session[:user_id]))
    end
  end

  def about

  end

  def ready
    session[:ready] = true
  end
end
