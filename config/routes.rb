Rails.application.routes.draw do
  devise_for :contacts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :contacts
  resources :pets

  root 'application#dashboard'

  resources :conversations do
  	resources :messages
  end
end
