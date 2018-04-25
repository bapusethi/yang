class PetsController < ApplicationController
  def new
    @pet = Pet.new
  end

  def show
  end

  def edit
  end

  def update
  end

  def create
    pet = Pet.create pet_params
    pet.pictures.create pet_image_params 
  end

  def index
    @pets = current_contact.pets
  end

  private

  def pet_params
    params.required(:pet).permit(%[name gender years months description]).merge(contact: current_contact)
  end

  def pet_image_params
    params.required(:pet).required(:pictures).permit(:image)
  end
end
