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
    # binding.pry
  end

  def update
    @pet = Pet.find(params[:pet_id])
    @record = Record.find(params[:id])
    @hospital = Hospital.find_by(id: params[:hospital_id])
    @records = @pet.records
    @record.update(record_params)
    if params[:record][:hospital_id].nil?
    redirect_to pet_path(@pet)
    elsif !params[:record][:hospital_id].nil?
    redirect_to edit_pet_record_path(@pet,@record)
    end
  end

  private

  def record_params
    params.require(:record).permit(:hospital_id, :content_type, :memo, :history, :record_image)
  end

end
