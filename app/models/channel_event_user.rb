class ChannelEventUser < ApplicationRecord
  belongs_to :event
  belongs_to :channel_user
end
