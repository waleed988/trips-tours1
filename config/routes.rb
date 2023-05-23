Rails.application.routes.draw do
  devise_for :users
  resources :users
  
  post "checkouts/create", to: "checkouts#create"
  get "checkouts/create", to: "checkouts#create"

  root "home#index"
  resources :tours
  resources :visitingpoints
  resources :transports
  resources :reviews
  resources :hotels
  # resources :webhooks
  # get "pricing", to:"plans#pricing"
  # post "billing_portal/create", to: "billing_portal#create", as: "billing_portal_create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
