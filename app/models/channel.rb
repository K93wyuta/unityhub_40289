class Channel < ApplicationRecord
  # Association
  has_one_attached :channel_main_image
  has_one_attached :channel_background_image

  has_secure_password
  
  has_many :channel_users, dependent: :destroy
  has_many :users, through: :channel_users
  has_many :administrators, -> { where(channel_users: { administrator: true }) }, through: :channel_users, source: :user
  has_many :albums, dependent: :destroy
  has_many :tweets, dependent: :destroy
  has_many :topics, dependent: :destroy
  has_many :events, dependent: :destroy

  # Validation
  validates :name, presence: true
  validates :identification, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true,  length: { minimum: 6, maximum: 128 }, if: :password_required?
  # validates :introduction

  def password_required?
    new_record? || password.present? || password_confirmation.present?
  end

end
