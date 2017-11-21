Rails.application.routes.draw do
  get 'items/new'

  # get 'static/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static#index'
  get "signup" => "users#new", as: "signup"
  get "login" => "sessions#new", as: "login"
  get "logout" => "sessions#destroy", as: "logout"
  resources :sessions, only: [:create]
  resources :users

end
