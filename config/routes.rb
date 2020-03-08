# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :contacts

  mount API => '/'

  resources :contacts
  resources :pets
 
  resources :conversations do
    resources :messages
  end

  root 'application#dashboard'

end
