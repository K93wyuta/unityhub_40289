class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

# アソシエーション
  has_one_attached :image
  has_many :channel_users

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender
  belongs_to :age
  belongs_to :mbti

# バリデーション
  VALID_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  VALID_ID_REGEX = /\A[a-zA-Z0-9]+\z/
  # validates :image(profile)
  validates :name, presence: true
  validates :email, presence: true
  validates_format_of :password, with: VALID_PASSWORD_REGEX
  # validates :gender_id
  # validates :age_id
  # validates :birthday
  # validates :mbti_id
  validates_format_of :line, with: VALID_ID_REGEX
  validates_format_of :paypay, with: VALID_ID_REGEX
  # validates :image(background)
  # validates :profile
end
