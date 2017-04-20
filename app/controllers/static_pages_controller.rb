class StaticPagesController < ApplicationController

  def home
    if session[:user_id]
      redirect_to user_path(current_user)
    end
  end

  def about

  end

  def ready
    session[:ready] = true
  end
end
