class Topic < ApplicationRecord
  # アソシエーション
  belongs_to :channel_user
  belongs_to :channel

  # バリデーション
  validates :title, presence: true
  validates :text, presence: true
end
