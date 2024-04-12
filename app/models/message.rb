class Message < ApplicationRecord
      # Association
      has_one_attached :message_image

      belongs_to :channel_chat_user
      belongs_to :chat
    
      # Validation
      validate :either_text_or_image
end
