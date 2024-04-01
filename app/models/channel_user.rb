class ChannelUser < ApplicationRecord
  belongs_to :channel
  belongs_to :user
  has_many :tweets

  def administrator?
    administrator == 1
  end
end
