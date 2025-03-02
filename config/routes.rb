Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/signup', to: "users#create"
  post '/login', to: "sessions#create"
  get '/me', to: "users#show"
  post '/recipes', to: "recipes#create"
  delete '/logout', to: "sessions#destroy"
  get '/recipes', to: "recipes#index"
end
