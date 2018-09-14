Rails.application.routes.draw do
  get     '/users',         to: 'users#index'
  get     '/users/:id',     to: 'users#show'
  post    '/users',         to: 'users#create'
  post    '/users/login',   to: 'users#login'
  delete  '/users/:id',     to: 'users#destroy'

  root to: "users#index"
end
