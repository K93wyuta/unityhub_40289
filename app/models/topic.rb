class Topic < ApplicationRecord
  # Association
  belongs_to :channel
  belongs_to :channel_user

  # Validation
  validates :title, presence: true
  validates :text, presence: true
end
