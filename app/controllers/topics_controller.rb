class TopicsController < ApplicationController

  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    @topic.save
    redirect_to topics_path
  end

  private
  def topic_params
      params.require(:topic).permit(:user_id, :category_id, :title, :content, :topic_image, :url)
  end


end
