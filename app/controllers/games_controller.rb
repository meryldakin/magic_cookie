class GamesController < ApplicationController

  def new
  end

  def create
    @game = Game.create(user_id: session[:user_id], score: 0)
    redirect_to game_path
  end

  def show

  end

  def update
    render game_path(params[:id])
  end




end
