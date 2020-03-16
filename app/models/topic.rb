class Topic < ApplicationRecord
  belongs_to :user
  belongs_to :category
  attachment :topic_image
end
