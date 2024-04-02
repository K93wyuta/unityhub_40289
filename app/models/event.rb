class Event < ApplicationRecord
  has_many :channel_event_users
  belongs_to :channel
end
