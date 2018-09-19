Rails.application.routes.draw do
  get     '/users',         to: 'users#index'
  get     '/users/:id',     to: 'users#show'
  post    '/users',         to: 'users#create'
  post    '/users/login',   to: 'users#login'
  delete  '/users/:id',     to: 'users#destroy'

  get     '/users/:user_id/trips',      to: 'trips#show'
  post    '/users/:user_id/trips',      to: 'trips#create'
  patch   '/users/:user_id/trips/:id',  to: 'trips#update'
  delete  '/users/:user_id/trips/:id',  to: 'trips#destroy'

  root to: "users#index"
end
