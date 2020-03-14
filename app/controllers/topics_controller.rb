class TopicsController < ApplicationController

  def index
    if params[:category_id] != nil
    @topics = Topic.where(category_id: params[:category_id]).page(params[:page])
    @topics_count = @topics.count
    @categories = Category.where(category_status: 0)
    @category = Category.find(params[:category_id])
    else
    @topics = Topic.all.page(params[:page])
    @topics_all = Topic.all
    @topics_count = @topics_all.count
    @categories = Category.where(category_status: 0)
    @categories = Category.all
    end
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    #binding.pry
    if @topic.save #入力されたデータをdbに保存する。
      redirect_to topics_path, notice: "トピックが作成されました!"
    else
      @topics = Topic.all
      @categories = Category.all
      render 'index'
    end
  end

  private
  def topic_params
      params.require(:topic).permit(:category_id, :title, :content, :topic_image, :url)
  end


end
