class Chat < ApplicationRecord
  # アソシエーション
  has_one_attached :chat_image
  belongs_to :channel_user
  belongs_to :channel

  # バリデーション
  validates :text, presence: true
end
