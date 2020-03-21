class TopicsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    if params[:category_id] != nil
    @topics = Topic.where(category_id: params[:category_id]).page(params[:page])
    @categories = Category.where(category_status: 0)
    @category = Category.find(params[:category_id])
    else
    @topics = Topic.page(params[:page])
    @categories = Category.where(category_status: 0)
    end
  end

  def new
    @topic = Topic.new
    @categories = Category.where(category_status: 0)
  end


  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    #binding.pry
    if @topic.save #入力されたデータをdbに保存する。
      redirect_to topics_path
      flash[:success] = "トピックが作成されました!"
    else
      #binding.pry
      @topics = Topic.all
      @categories = Category.where(category_status: 0)
      render 'index'
    end
  end

  private
  def topic_params
      params.require(:topic).permit(:category_id, :title, :content, :topic_image, :url)
  end


end
