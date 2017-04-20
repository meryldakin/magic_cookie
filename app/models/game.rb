class Game < ApplicationRecord
  belongs_to :user
  has_many :game_fortunes
  has_many :fortunes, through: :game_fortunes


  # @@original_fortune = Fortune.select_fortune.proverb

  def fortune_scrambler
    # @fortune = Fortune.all.sample
    # @fortune = Fortune.select_fortune
    # @original_fortune = original_fortune
    original_fortune = Fortune.select_fortune
    self.fortunes << original_fortune
    self.save
    fortune = original_fortune.proverb.downcase.gsub(/[^a-z0-9\s]/i, '') #removes punctation
    fortune.split(' ').shuffle.join(' ')
  end

  def current_fortune
    current_fortune_id = self.game_fortunes.last.fortune_id
    Fortune.find(current_fortune_id)
  end

  def last_fortune
    last_fortune_id = self.game_fortunes[-2].fortune_id
    Fortune.find(last_fortune_id)
  end

  def self.all_fortunes
    Fortune.all.map do |fortune|
      fortune.proverb.downcase.gsub(/[^a-z0-9\s]/i, '')
    end
  end



  # def original_fortune
  #   @original_fortune
  #   # @original_fortune.proverb
  # end

  def check_user_input

  end

  def correct_answer

  end

  def incorrect_answer

  end

  def bad_answer

  end


end
