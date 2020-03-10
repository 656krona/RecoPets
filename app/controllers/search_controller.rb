class SearchController < ApplicationController

  def search
    @hospitals = Hospital.search(params[:search],params[:prefecute_name])
  end


end
