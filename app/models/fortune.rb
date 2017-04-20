class Fortune < ApplicationRecord
  has_many :game_fortunes
  has_many :games, through: :game_fortunes



  # def fortune_scrambler
  #   # @fortune = Fortune.all.sample
  #   # @fortune = Fortune.select_fortune
  #   @fortune = fortune.downcase.gsub(/[^a-z0-9\s]/i, '') #removes punctation
  #   @fortune.split(' ').shuffle.join(' ')
  # end

  def self.select_fortune
    fortune = Fortune.all.sample #returns instance random fortune
    #@fortune.proverb #returns the string from that instance
  end


end
