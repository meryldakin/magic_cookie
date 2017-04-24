class Game < ApplicationRecord
  belongs_to :user
  has_many :game_fortunes
  has_many :fortunes, through: :game_fortunes

  def fortune_scrambler
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

  def correct_answer(answer)
    answer.downcase.gsub(/[^a-z0-9\s]/i, '') == self.current_fortune.proverb.downcase.gsub(/[^a-z0-9\s]/i, '')
  end

  def win_round
    self.difficulty == "easy" ? self.score += 75 : self.score += 100
    round_fortune = self.game_fortunes.last
    round_fortune.won
    round_fortune.save
    self.save
  end

  def lose_round
    self.difficulty == "easy" ? self.score -= 50 : self.score -= 75
    round_fortune = self.game_fortunes.last
    round_fortune.lost
    round_fortune.save
    self.save
  end

  def won_fortunes
    gf_array = self.game_fortunes.select do |gf|
      gf.result == "won"
    end
    gf_array.map do |gf|
      Fortune.find(gf.fortune_id)
    end
  end

  # def check_user_input(correct_answer)
  #   if correct_answer
  #     self.score += 100
  #     self.save
  #     if self.score < 300
  #       # session[:bear] = "won" #won a round
  #       redirect_to game_path(self)
  #     else
  #       # session[:won] = true
  #       user.cumulative_score += self.score
  #       user.current_score = self.score
  #       user.save
  #       redirect_to game_over_path(self)
  #     end
  #   elsif correct_answer == false
  #     self.score -= 75
  #     self.save
  #     if self.score > 0
  #       # session[:bear] = "lost" #lost a round
  #       redirect_to game_path(self)
  #     else
  #       # session[:won] = false
  #       user.cumulative_score += self.score
  #       user.current_score = self.score
  #       user.save
  #       redirect_to game_over_path(self)
  #     end
  #   end
  # end
end
