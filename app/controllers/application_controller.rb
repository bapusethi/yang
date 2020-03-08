# frozen_string_literal: true

class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
  before_action :authenticate_contact!

  skip_before_action :authenticate_contact!, only: [:dashboard]

  def dashboard
    @nearby_contacts = if current_contact
                         Contact.near(
                          [current_contact.latitude || SYDNEY_LATITUDE, current_contact.longitude || SYDNEY_LONGITUDE], 10)
                       else
                         Contact.near([SYDNEY_LATITUDE, SYDNEY_LONGITUDE], 10)
                       end
                       .limit(100)
                       .map do |contact|
      { lat: contact.latitude, lng: contact.longitude, infowindow: info(contact) }
    end.to_json
  end

  private

  def info(contact)
    view_context.content_tag(:div, pet_link(contact))
  end

  def pet_link(contact)
    pet_picture = contact.pets.first&.pictures&.first
    path = contact_path(contact)
    if pet_picture
      image = pet_picture.image(:thumb)
      view_context.link_to(view_context.image_tag(image), path)
    else
      view_context.link_to(contact.name, path)
    end
  end
end
