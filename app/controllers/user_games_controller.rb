class UserGamesController < ApplicationController
  def index
    @user_id = params[:user_id]
    @user = User.find(@user_id)
    @games = @user.games
  end

  def show
  end

end
