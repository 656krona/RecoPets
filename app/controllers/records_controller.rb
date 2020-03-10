class RecordsController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
  end

  private

  def record_params
    params.require(:record).permit(:content_type, :memo, :record_image)
  end

end
