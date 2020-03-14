class RecordsController < ApplicationController

  def select
    @pet = Pet.find(params[:pet_id])
    @record = Record.find(params[:id])
    @hospitals = Hospital.all
  end

  def edit
    @hospitals = Hospital.all
    @pet = Pet.find(params[:pet_id])
    @record = Record.find(params[:id])
    @hospital = Hospital.find_by(id: params[:hospital_id])
    #hospitalcontroller削除予定
  end

  def update
    @pet = Pet.find(params[:pet_id])
    @record = Record.find(params[:id])
    @records = @pet.records
    @record.update(record_params)
    #edit_pet_record_path(@pet,@record)
    redirect_to pet_path(@pet)
  end

  private

  def record_params
    params.require(:record).permit(:hospital_id, :content_type, :memo, :history, :record_image)
  end

end
