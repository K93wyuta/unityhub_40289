class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アソシエーション
  has_one_attached :profile_image
  has_one_attached :background_image
  has_many :channel_users
  has_many :channels, through: :channel_users

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender
  belongs_to :age
  belongs_to :mbti

  # バリデーション
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  VALID_ID_REGEX = /\A[a-zA-Z0-9_]+\z/
  # validates :image(profile)
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }, 
  format: { with: VALID_PASSWORD_REGEX }, on: :create
  validates :password, length: { minimum: 6 },
  format: { with: VALID_PASSWORD_REGEX }, allow_blank: true, on: :update
  # validates :gender_id
  # validates :age_id
  # validates :birthday
  # validates :mbti_id
  validates_format_of :line, with: VALID_ID_REGEX, allow_blank: true
  validates_format_of :paypay, with: VALID_ID_REGEX, allow_blank: true
  # validates :image(background)
  # validates :profile
end
