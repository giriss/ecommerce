# frozen_string_literal: true

Rails.application.routes.draw do
  resources :products do
    resources :images
    resources :price_changes
  end

  resources :brands do
    resources :products
  end

  resources :users, except: :index do
    resources :addresses
    post '/authenticate', on: :collection, action: :authenticate
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
