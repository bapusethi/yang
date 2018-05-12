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
    pet = current_contact.pets.create pet_params
    pet.pictures.create pet_image_params
    redirect_to pets_path
  end

  def index
    if params[:contact_id]
      @pets = Contact.find(params[:contact_id]).pets
    else
      @pets = current_contact.pets
    end
  end

  private

  def pet_params
    params.required(:pet).permit(%i[name gender years months description])
  end

  def pet_image_params
    params.required(:pet).required(:pictures).permit(:image)
  end
end
