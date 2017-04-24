class GameFortune < ApplicationRecord
  belongs_to :game
  belongs_to :fortune

  def won
    self.result = "won"
  end

  def lost
    self.result = "lost"
  end


end
