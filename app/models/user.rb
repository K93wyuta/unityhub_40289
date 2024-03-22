class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :channel_users

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender
  belongs_to :age
  belongs_to :mbti
end
