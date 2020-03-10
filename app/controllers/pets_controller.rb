class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def new
    @pet = Pet.new
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
      params.require(:pet).permit(:name, :pet_image)
  end
end
