Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # RECIPES
  get "/recipes" => "recipes#index"
  get "/recipes/:id" => "recipes#show"
  post "/recipes" => "recipes#create"
  patch "/recipes/:id" => "recipes#update"
  delete "/recipes/:id" => "recipes#destroy"

  # USERS
  post "/users" => "users#create"
  get "/users" => "users#index"

  # SESSIONS
  post "/sessions" => "sessions#create"

  # CATEGORY
  get "/categories" => "categories#index"
  post "/categories" => "categories#create"

end
