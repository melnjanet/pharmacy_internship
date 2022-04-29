Rails.application.routes.draw do
  apipie
  root "home#index"

  resources :accounts
  resources :admins
  resources :atc_codes
  resources :carts
  resources :countries
  resources :generic_names
  resources :items
  resources :manufactures
  resources :nomenclatures
  resources :orders
  resources :recipes
  resources :users
end
