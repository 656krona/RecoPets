class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  attachment :comment_image
end
