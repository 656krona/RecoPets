class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

  def select
    @pet = Pet.find(params[:pet_id])
    @record = Record.find(params[:id])
    @hospitals = Hospital.all
  end

  def edit
    @hospitals = Hospital.all
    @pet = Pet.find(params[:pet_id])
    @record = Record.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:pet_id])
    @record = Record.find(params[:id])
    @hospital = Hospital.find_by(id: params[:hospital_id])
    @records = @pet.records
    @record.score = Language.get_data(record_params[:memo])
    @record.update(record_params)
    start_time = @record.start_time.strftime('%Y-%m-%d')
    if params[:record][:hospital_id].nil?
      redirect_to pet_path(@pet, start_date: start_time)
    else
      redirect_to edit_pet_record_path(@pet, @record, start_date: start_time)
    end
  end

  private

  def record_params
    params.require(:record).permit(:hospital_id, :content_type, :memo, :history, :record_image)
  end

  #url直接防止　メソッドを自己定義してbefore_actionで発動
  def correct_user
    record = Record.find(params[:id])
    pet = Pet.find_by(id: record.pet_id)
    user = User.find_by(id: pet.user_id)
    if current_user != user
      redirect_to pets_path
    end
  end

end
