class Tweet < ApplicationRecord
  belongs_to :channel_user
  belongs_to :channel
end
