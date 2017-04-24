class GameFortune < ApplicationRecord
  belongs_to :game
  belongs_to :fortune

  def won
    self.result = "won"
    self.save
  end

  def lost
    self.result = "lost"
    self.save
  end


end
