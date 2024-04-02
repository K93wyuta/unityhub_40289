class ChannelUser < ApplicationRecord
  belongs_to :channel
  belongs_to :user
  has_many :tweets
  has_many :channel_event_users

  def administrator?
    administrator == 1
  end
end
