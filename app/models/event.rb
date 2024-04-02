class Event < ApplicationRecord
  has_one_attached :event_image
  has_many :channel_event_users, dependent: :destroy
  belongs_to :channel
end
