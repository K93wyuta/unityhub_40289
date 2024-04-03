class Album < ApplicationRecord
    # アソシエーション
    has_many_attached :album_images
    belongs_to :channel

    # バリデーション
    validates :title, presence: true
end
