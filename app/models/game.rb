class Game < ApplicationRecord
  belongs_to :user
  has_many :game_fortunes
  has_many :fortunes, through: :game_fortunes


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

  def show_scrambled_fortune
    @scrambled_fortune = Fortune.fortune_scrambler

  end

  def check_user_input

  end

  def correct_answer

  end

  def incorrect_answer

  end

  def bad_answer

  end


end
