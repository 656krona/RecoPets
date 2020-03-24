class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :baria_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @pets = Pet.where(user_id: current_user.id)
    @topics = Topic.where(user_id: current_user.id)
    @comments = Comment.where(user_id: current_user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "登録内容を変更しました！"
      redirect_to user_path(current_user.id)
    else
      render 'edit'
    end
  end

  private
  def user_params
      params.require(:user).permit(:name, :profile_image)
  end

  #url直接防止
  def baria_user
    unless params[:id].to_i == current_user.id
      redirect_to user_path(current_user)
    end
  end

end
