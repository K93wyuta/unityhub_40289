class Event < ApplicationRecord
  # アソシエーション
  has_one_attached :event_image
  has_many :channel_event_users, dependent: :destroy
  belongs_to :channel

  # バリデーション
  validates :name, presence: true
  validates :date_start, presence: true
  validates :date_end, presence: true
  validates :time_start, presence: true
  validates :time_end, presence: true
end
