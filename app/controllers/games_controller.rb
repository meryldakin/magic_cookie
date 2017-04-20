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

  end

  def update
    @answer = params[:user_answer]
    @game = Game.find(session[:game_id])
    if @game.score < 300 && @game.score > -75 #if game is active
      if Game.all_fortunes.include?(@answer.downcase.gsub(/[^a-z0-9\s]/i, ''))
        # == @game.original_fortune.downcase.gsub(/[^a-z0-9\s]/i, '')
        @game.score += 100
        @game.save
        session[:bear] = "won" #won a round
        redirect_to game_path(@game)
      else
        @game.score -= 75
        @game.save
        session[:bear] = "lost" #lost a round
        redirect_to game_path(@game)
      end
    elsif @game.score > 299 || @game.score < -74
      user = User.find(session[:user_id])
      user.cumulative_score += @game.score
      user.current_score = @game.score
      user.save
        if @game.score > 299
          session[:won] = true
        else
          session[:won] = false
        end
        redirect_to game_over_path(@game)
    end
  end



  def game_over
  end


end
