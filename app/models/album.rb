class Album < ApplicationRecord
    # アソシエーション
    belongs_to :channel
  
    # バリデーション
    validates :title, presence: true
end
