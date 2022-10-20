Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  get 'books/index'
  get 'books/new'
  get 'books/create'
  get 'books/show'
  get 'books/edit'
  get 'books/update'
  get 'books/destroy'
  get 'users/index'
  get 'users/new'
  get 'users/create'
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'
  get 'hello/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "hello#index"
end
