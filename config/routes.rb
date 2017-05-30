Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "pages#index"

  resources :recipes
  resources :users 
  get '/users/:id/recipes' => "users#recipes"
  resources :sessions, controller: "sessions", only: [:new,:create,:destroy]
  resources :favourites, controller: "favourites", only: [:new,:index]
end
