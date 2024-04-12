class ChannelChatUser < ApplicationRecord
    # Association
    has_many :messages
    
    belongs_to :channel_user
    belongs_to :chat
  
    # Validation
end
