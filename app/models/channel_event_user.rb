class ChannelEventUser < ApplicationRecord
  # Association
  belongs_to :channel_user
  belongs_to :event

  # Validation
end
