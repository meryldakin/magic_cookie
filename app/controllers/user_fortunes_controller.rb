class UserFortunesController < ApplicationController

  def index
    @user_id = params[:user_id]
    @user = User.find(@user_id)
  end

end
