Rails.application.routes.draw do
  root 'books#index'
  resources :users
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/carts', to: 'carts#index'
  post '/carts', to: 'carts#create'
  delete '/carts', to: 'carts#destroy'

  resources :books do
    resources :comments, only: [:create, :destroy]
  end
end
