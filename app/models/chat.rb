class Chat < ApplicationRecord
    # Association
    has_one_attached :chat_image

    has_many :channel_chat_users, dependent: :destroy
    has_many :messages
  
    belongs_to :channel
  
    # Validation
    validates :name, presence: true
end
