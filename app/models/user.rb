class User < ApplicationRecord
  has_many :games
  has_many :game_fortunes, through: :games
  has_many :fortunes, through: :game_fortunes
  has_secure_password

  def update_user_scores(game)
    self.cumulative_score += game.score
    self.current_score = game.score
    self.save
  end

  def winning_fortunes
    game_fortune_array = self.game_fortunes.all.select do |fortune|
      fortune.result == "won"
    end

    game_fortune_array.map do |game_fortune|
      Fortune.find(game_fortune.fortune_id)
    end

  end



end
