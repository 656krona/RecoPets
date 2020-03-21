class PetsController < ApplicationController
  def index
    @pets = Pet.where(user_id: current_user.id)
  end

  def new
    @pet = Pet.new
  end

  def show
    require 'date'
    date = Date.today

    @pet = Pet.find(params[:id])
    if params[:start_date].blank? && @pet.records.where(start_time: date.beginning_of_month.strftime("%Y-%m-%d 15:%M:%S")).empty?
      firstday = date.beginning_of_month
      lastday = date.end_of_month
      #文字列にすると時間を含んだeach文となり無限ループ状態なのでダメ
      (firstday..lastday).each do |day|
        @record = Record.new(start_time: day)
        #binding.pry
        @record.pet_id = @pet.id
        @record.save
      end
    elsif !params[:start_date].blank? && @pet.records.where(start_time: Date.parse(params[:start_date]).beginning_of_month.strftime("%Y-%m-%d 15:%M:%S")).empty?
      firstday = Date.parse(params[:start_date]).beginning_of_month
      lastday = Date.parse(params[:start_date]).end_of_month
      (firstday..lastday).each do |day|
        @record = Record.new(start_time: day)
        @record.pet_id = @pet.id
        @record.save
      end
    else
    end

    @records = @pet.records
    @user = @pet.user_id
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user_id = current_user.id
    @pet.save
    redirect_to pets_path
  end

  def destroy
  end

  private
  def pet_params
      params.require(:pet).permit(:name, :user_id, :pet_image)
  end
end
