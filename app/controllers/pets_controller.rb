# frozen_string_literal: true

class PetsController < ApplicationController
  def new
    @pet = Pet.new
  end

  def show; end

  def edit; end

  def update; end

  def create
    pet = current_contact.pets.create pet_params
    pet.pictures.create pet_image_params
    redirect_to pets_path
  end

  def index
    @pets = if params[:contact_id]
              Contact.find(params[:contact_id]).pets
            else
              current_contact.pets
            end
  end

  def destroy
    Pet.destroy params[:id]
    redirect_to pets_path
  end

  private

  def pet_params
    params.required(:pet).permit(%i[name gender years months description])
  end

  def pet_image_params
    params.required(:pet).permit(:pictures)
  end
end
