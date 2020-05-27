class Admins::UsersController < ApplicationController

  def index
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "登録内容を編集しました！"
      redirect_to admins_users_path
    else
      render 'edit'
    end
  end

  private
  def user_params
      params.require(:user).permit(:name, :email)
  end

end
