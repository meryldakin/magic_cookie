class User < ApplicationRecord
  has_many :games
  has_many :game_fortunes, through: :games
  has_secure_password

  def update_user_scores(game)
    self.cumulative_score += game.score
    self.current_score = game.score
    self.save
  end

end
