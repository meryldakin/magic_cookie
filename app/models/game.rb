class Game < ApplicationRecord
  belongs_to :user
  has_many :game_fortunes
  has_many :fortunes, through: :game_fortunes


  # @@original_fortune = Fortune.select_fortune.proverb



  def gameplay
    show_scrambled_fortune
    check_user_input
    if #correct
      correct_answer
    elsif #incorrect
      incorrect_answer
    elsif #bad_answer
      bad_answer
    end
  end

  def game_fortunes
    five_proverbs = Fortune.all.shuffle.take(5)
  end

  def fortune_scrambler
    # @fortune = Fortune.all.sample
    # @fortune = Fortune.select_fortune
    # @original_fortune = original_fortune
    @original_fortune = Fortune.select_fortune.proverb
    @fortune = @original_fortune.downcase.gsub(/[^a-z0-9\s]/i, '') #removes punctation
    @fortune.split(' ').shuffle.join(' ')
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
