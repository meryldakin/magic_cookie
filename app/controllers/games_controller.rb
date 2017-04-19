class GamesController < ApplicationController
  before_action :require_login
  
  def new
    redirect_to create_game_path
  end

  def create
    @game = Game.create(user_id: session[:user_id], score: 0)
    session[:game_id] = @game.id
    redirect_to game_path(@game)
  end

  def show

  end

  def update
    @answer = params[:user_answer]
    @game = Game.find(session[:game_id])
    if @game.score < 3 && @game.score > -1
      if Game.all_fortunes.include?(@answer.downcase.gsub(/[^a-z0-9\s]/i, ''))
        # == @game.original_fortune.downcase.gsub(/[^a-z0-9\s]/i, '')
        @game.score += 1
        @game.save
        session[:bear] = false
        redirect_to game_path(@game)
      else
        @game.score -= 1
        @game.save
        session[:bear] = true
        redirect_to game_path(@game)
      end
    elsif @game.score == 3 || @game.score < 0
      user = User.find(session[:user_id])
      user.cumulative_score += @game.score
      user.current_score = @game.score
      user.save
      if @game.score == 3
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
