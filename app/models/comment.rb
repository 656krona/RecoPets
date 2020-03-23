class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  has_many :likes, dependent: :destroy
  attachment :comment_image

  validates :comment, presence: {message: "を入力してください"}, length: { maximum: 200 }
  def favorited_by?(user)
    likes.where(user_id: user.id).exists?
  end

end
