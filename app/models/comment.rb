class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  has_many :likes, dependent: :destroy
  attachment :comment_image
end
