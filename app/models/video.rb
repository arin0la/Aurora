class Video < ApplicationRecord
  has_one_attached :video
  has_many :mixes
end
