class ChannelUser < ApplicationRecord
  # Association
  has_many :tweets, dependent: :destroy
  has_many :channel_chat_users, dependent: :destroy
  has_many :channel_event_users, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :events, through: :channel_event_users
  has_many :topics, dependent: :destroy

  belongs_to :channel
  belongs_to :user

  def administrator?
    administrator == 1
  end

  # Validation
end
