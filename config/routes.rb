Rails.application.routes.draw do
  apipie
  root "home#index"
  get "admin", to: "admins/dashboard#index"

  namespace :admins do
    root "dashboard#index"
    get :dashboard, to: "dashboard#index"

    resources :admins
    resources :accounts
    resources :atc_codes
    resources :countries
    resources :generic_names
    resources :manufactures
    resources :nomenclatures
    resources :items
    resources :recipes
  end

  resources :carts
  resources :orders
  resources :users
end
