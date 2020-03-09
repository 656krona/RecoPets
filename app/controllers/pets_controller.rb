class PetsController < ApplicationController
  def index
    @pets = Pets.all
  end

  def new
    @pet = Pets.new
  end

  def create
  end

  def destroy
  end

end
