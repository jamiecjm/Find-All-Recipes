Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "pages#index"

  resources :recipes
  resources :users
  resources :sessions, controller: "sessions", only: [:new,:create,:destroy]
end
