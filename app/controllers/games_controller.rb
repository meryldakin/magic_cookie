class GamesController < ApplicationController
  before_action :require_login

  def new
    redirect_to create_game_path
  end

  def create
    session[:ready] = false
    @game = Game.create(user_id: session[:user_id], score: 0)
    session[:game_id] = @game.id
    session[:bear] = "new"
    redirect_to game_path(@game)
  end

  def show
    @game = Game.find(session[:game_id])
  end

  def update
    answer = params[:user_answer]
    @game = Game.find(session[:game_id])
    user = current_user
    if @game.correct_answer(answer)
      @game.win_round
      if @game.score < 300
        session[:bear] = "won" #won a round
        redirect_to game_path(@game)
      else
        session[:won] = true
        user.update_user_scores(@game)
        redirect_to game_over_path(@game )
      end
    elsif @game.correct_answer(answer) == false
      @game.lose_round
      if @game.score > 0
        session[:bear] = "lost" #lost a round
        redirect_to game_path(@game)
      else
        session[:won] = false
        user.update_user_scores(@game)
        redirect_to game_over_path(@game)
      end
    end
  end


end
