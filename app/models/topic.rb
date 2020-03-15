class Topic < ApplicationRecord
  belongs_to :user
  belongs_to :categories
  attachment :topic_image
end
