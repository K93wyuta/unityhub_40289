class ChannelUser < ApplicationRecord
  # Association
  has_many :tweets
  has_many :channel_event_users, dependent: :destroy
  has_many :events
  has_many :events, through: :channel_event_users
  has_many :topics

  belongs_to :channel
  belongs_to :user

  def administrator?
    administrator == 1
  end

  # Validation
end
