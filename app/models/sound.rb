class Sound < ApplicationRecord

  has_one_attached :mp3
  validates :mp3, presence: true
  
  has_many :mix_sounds

end
