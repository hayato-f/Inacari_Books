Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  # get 'order/index'
  # get 'carts/index'
  root 'books#index'
  resources :users
  post 'carts', to: 'carts#index'
  get 'orders', to: 'orders#index'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :books do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
end
