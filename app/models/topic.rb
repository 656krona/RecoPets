class Topic < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments
  attachment :topic_image

  validates :title, presence: {message: "を入力してください"}
end
