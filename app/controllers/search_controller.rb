class SearchController < ApplicationController

  def search
    #@pet = Pet.find(params[:pet_id])
    #@record = Record.find(params[:id])
    @hospitals = Hospital.search(params[:search],params[:prefecute_name])
  end


end
