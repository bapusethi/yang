class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_contact!

  skip_before_action :authenticate_contact!, only: [:dashboard]
  
  def dashboard
    @nearby_contacts = if current_contact
                         Contact.near([current_contact.latitude || 0, current_contact.longitude || 0], 10)
                       else
                         Contact.near([SYDNEY_LATITUDE,SYDNEY_LONGITUDE], 10)
                       end
                      .limit(100)
                      .map{ |contact| 
                        { lat: contact.latitude,
                          lng: contact.longitude,
                          infowindow: info(contact)
                        } 
                      }.to_json
  end

  private

  def info(contact)
    pet = contact.pets.first && contact.pets.first.pictures.first ? view_context.link_to(view_context.image_tag(contact.pets.first.pictures.first.image(:thumb)), contact_path(contact))
                             : view_context.link_to(contact.name, contact_path(contact))

    view_context.content_tag(:div, pet)
  end
end
