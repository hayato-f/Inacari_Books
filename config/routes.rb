Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  # get 'order/index'
  # get 'carts/index'
  root 'books#index'
  resources :users
  get 'carts', to: 'carts#index'
  post 'carts', to: 'carts#create'
  get 'orders', to: 'orders#new'
  post 'orders', to: 'orders#create'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :books do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
end
