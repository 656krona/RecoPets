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
  end

end