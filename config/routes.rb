Rails.application.routes.draw do
  devise_for :users,
    path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'signup'
    },
    controllers: {
      sessions: 'sessions'
    },
    defaults: { format: :json }


  get     '/users',         to: 'users#index'
  # get     '/users/:id',     to: 'users#show'
  # delete  '/users/:id',     to: 'users#destroy'

  # resources :sessions, only: [:create, :destroy]

  root to: "users#index"
end
