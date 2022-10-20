Rails.application.routes.draw do
  root 'books#index'
  resources :users

  resources :books do
    resources :comments, only: [:create, :destroy]
  end
end
