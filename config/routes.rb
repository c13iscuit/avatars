Rails.application.routes.draw do

  root "users#index"

  get "log_in" => "sessions#new", as: "log_in"
  get "log_out" => "sessions#destroy", as: "log_out"
  get "sign_up" => "users#new", as: "sign_up"

  resources :users, only: [:index, :new, :create, :edit, :update]
  resources :sessions

end
