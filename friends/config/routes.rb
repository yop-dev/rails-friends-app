# config/routes.rb
Rails.application.routes.draw do
  root "sessions#new"  # default root goes to login page
  resources :users, only: [:new, :create]
  resources :friends
  resource :profile, only: [:show, :edit, :update]


  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
