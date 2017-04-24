class Fortune < ApplicationRecord
  has_many :game_fortunes
  has_many :games, through: :game_fortunes
  has_many :users, through: :game_fortunes

  def self.select_fortune
    fortune = Fortune.all.sample #returns instance random fortune
    #@fortune.proverb #returns the string from that instance
  end


end
