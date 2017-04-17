class User < ApplicationRecord
  has_many :games
  has_many :game_fortunes, through: :games
  has_secure_password


end
