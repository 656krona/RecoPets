class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :pets, dependent: :destroy
  has_many :topics
  has_many :comments
  has_many :items
  has_many :likes, dependent: :destroy
  attachment :profile_image, destroy: false

  validates :email, presence: true
  validates :password, presence: true
end
