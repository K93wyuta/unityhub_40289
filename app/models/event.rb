class Event < ApplicationRecord
  # Association
  has_one_attached :event_image

  has_many :channel_event_users, dependent: :destroy
  has_many :channel_users, through: :channel_event_users

  belongs_to :channel

  # Validation
  validates :name, presence: true
  validates :date_start, presence: true
  validates :date_end, presence: true
  validates :time_start, presence: true
  validates :time_end, presence: true
end
