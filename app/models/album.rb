class Album < ApplicationRecord
  # Association
  has_many_attached :album_images

  belongs_to :channel

  # Validation
  validates :title, presence: true
end
