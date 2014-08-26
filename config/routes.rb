Rails.application.routes.draw do

  root "users#index"

  get "sign_up" => "users#new", as: "sign_up"

  resources :users, only: [:index, :new, :create, :edit, :update]

end
