class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_contact!
  def dashboard
  	@nearby_contacts = Contact.near([current_contact.latitude, current_contact.longitude], 10)
  	                          .limit(100)
  	                          .map{ |contact| {lat: contact.latitude, lng: contact.longitude, infowindow: contact.first_name } }.to_json
  end
end
