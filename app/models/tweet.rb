class Tweet < ApplicationRecord
  belongs_to :channel_user
  belongs_to :channel
  has_one_attached :tweet_image 
end
