class RecordsController < ApplicationController

  def edit
    @pet = Pet.find(params[:pet_id])
    @record = Record.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:pet_id])
    @record = Record.find(params[:id])
    @records = @pet.records
    @record.update(record_params)
    redirect_to pet_path(@pet)
  end

  private

  def record_params
    params.require(:record).permit(:content_type, :memo, :record_image)
  end

end
