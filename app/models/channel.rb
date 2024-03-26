class Channel < ApplicationRecord
  has_one_attached :channel_main_image
  has_one_attached :channel_background_image
  has_secure_password
  has_many :channel_users
  has_many :users, through: :channel_users
  has_many :administrators, -> { where(channel_users: { administrator: true }) }, through: :channel_users, source: :user
  has_many :albums
  has_many :tweets
  has_many :topics
  has_many :events

  validates :name, presence: true
  validates :identification, presence: true
  validates :password, presence: true
  # validates :introduction
end

