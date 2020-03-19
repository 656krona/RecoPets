class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  has_many :likes, dependent: :destroy
  attachment :comment_image

  def favorited_by?(user)
    likes.where(user_id: user.id).exists?
  end

end
