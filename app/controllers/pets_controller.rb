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
    pet_params = params[:pet].to_unsafe_h.merge(contact: current_contact)
    Pet.create pet_params
  end

  def index
    @pets = current_contact.pets
  end
end
