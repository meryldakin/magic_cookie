class Fortune < ApplicationRecord
  has_many :game_fortunes
  has_many :games, through: :game_fortunes


  # def self.random_fortune_getter
  #   @fortune = Fortune.all.sample
  # end

  def self.fortune_scrambler
    #random_fortune_getter.scramble
    @fortune = Fortune.all.sample
    @fortune.proverb.reverse
  end


end
