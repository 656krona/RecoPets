class LikesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @topic = Topic.find(params[:topic_id])
    @comment = Comment.find(params[:comment_id])
    like = current_user.likes.new(comment_id: @comment.id)
    like.save
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @comment = Comment.find(params[:comment_id])
    like = current_user.likes.find_by(comment_id: @comment.id)
    like.destroy
  end

end
