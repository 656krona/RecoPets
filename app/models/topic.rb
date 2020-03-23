class Topic < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments
  attachment :topic_image

  validates :category_id, presence: {message: "が入力されていません"}
  validates :title, presence: {message: "が入力されていません"}
end
