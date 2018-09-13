Rails.application.routes.draw do
  get     '/users',         to: 'users#index'
  get     '/users/:id',     to: 'users#show'
  post    '/users',         to: 'users#create'

  root to: "users#index"
end
