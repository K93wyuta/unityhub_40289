class Tweet < ApplicationRecord
  # Association
  has_one_attached :tweet_image
  
  belongs_to :channel_user
  belongs_to :channel

  # Validation
  validate :either_text_or_image

  private

  def either_text_or_image
    return if text.present? || tweet_image.attached?

    errors.add(:base, 'Either text or image must be present.')
  end
end
