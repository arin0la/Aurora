class Sound < ApplicationRecord
  # has_one_attached :mp3
  has_many :mix_sounds
end
