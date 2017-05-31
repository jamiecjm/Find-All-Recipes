Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "recipes#index"

  resources :recipes
  post '/search_recipes' => 'recipes#search'
  get '/filter_recipes' => 'recipes#filter'
  get '/ingredients_fact/:id' => 'recipes#facts'

  resources :users 
  get '/users/:id/recipes' => "users#recipes"

  resources :sessions, controller: "sessions", only: [:new,:create,:destroy]
  resources :favourites, controller: "favourites", only: [:new,:index]
  get '/fav/:id' => 'favourites#fav'

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  resource :passwords, controller: "passwords"
  post '/update_passwords' => 'passwords#update'

end
