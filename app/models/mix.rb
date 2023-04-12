class Mix < ApplicationRecord
  # belongs_to :video
  has_many :mix_sounds
  has_many :sounds, through: :mix_sounds
  belongs_to :user
end
