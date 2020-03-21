class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    @topic = Topic.find(params[:topic_id])
    @comments = Comment.where(topic_id: params[:topic_id]).page(params[:page])
    @categories = Category.where(category_status: 0)
    @comment = Comment.new(topic_id: @topic.id)
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @comments = @topic.comments
    @comment = @topic.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "コメントが投稿されました"
    else
      @comments = Comment.where(id: @topic)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :url, :comment_image)
  end


end
