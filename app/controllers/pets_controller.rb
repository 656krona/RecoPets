class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def new
    @pet = Pet.new
  end

  def show
    #date = Time.parse(params[:start_date])
    #t = Time.new(date)
    #firstday = t.beginning_of_month
    #lastday = t.end_of_month

    #date = Date._strptime(params[:start_date])
    # {:year=>2017, :mon=>9, :mday=>1}
    #y = date2[:year]
    #m = date2[:mon]
    #d = Date.new(y,m,1).to_time
    require 'date'
    date = Date.today
    #d.strftime("%Y/%m/%d %H:%M:%S") => "2020/03/20 00:00:00"
    @pet = Pet.find(params[:id])
    if params[:start_date] == nil && @pet.records.where(start_time: date.beginning_of_month.strftime("%Y-%m-%d %H:%M:%S")).empty?
      firstday = date.beginning_of_month
      lastday = date.end_of_month
      #文字列は時間を含んだeach文を回し無限ループ状態なのでダメ
      (firstday..lastday).each do |day|
        @record = Record.new(start_time: day, hospital_id: 1)
        #binding.pry
        @record.pet_id = @pet.id
        @record.save
      end
    elsif params[:start_date] != nil && @pet.records.where(start_time: Date.parse(params[:start_date]).beginning_of_month.strftime("%Y-%m-%d %H:%M:%S")).empty?
      firstday = Date.parse(params[:start_date]).beginning_of_month
      lastday = Date.parse(params[:start_date]).end_of_month
      #binding.pry
      (firstday..lastday).each do |day|
        @record = Record.new(start_time: day, hospital_id: 1)
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
