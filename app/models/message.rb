class Message < ApplicationRecord
  # Association
  has_one_attached :message_image

  belongs_to :channel_chat_user
  belongs_to :chat

  # Validation
  validate :either_content_or_image

  def either_content_or_image
    return if content.present? || message_image.attached?
    
    errors.add(:base, 'Either text or image must be present.')
  end
end
