class Channel < ApplicationRecord
  # アソシエーション
  has_one_attached :channel_main_image
  has_one_attached :channel_background_image
  has_secure_password
  has_many :channel_users, dependent: :destroy
  has_many :users, through: :channel_users
  has_many :administrators, -> { where(channel_users: { administrator: true }) }, through: :channel_users, source: :user
  has_many :albums, dependent: :destroy
  has_many :tweets, dependent: :destroy
  has_many :topics, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :chats, dependent: :destroy

  # バリデーション
  validates :name, presence: true
  validates :identification, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6, maximum: 128 }
  # validates :introduction
end
