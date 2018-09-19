# ---------------------------------------------------------------------------------------------------------
# Prefix Verb                URI Pattern                      Controller#Action
# ---------------------------------------------------------------------------------------------------------
# new_user_session           GET    /login(.:format)          sessions#new {:format=>:json}
# user_session               POST   /login(.:format)          sessions#create {:format=>:json}
# destroy_user_session       DELETE /logout(.:format)         sessions#destroy {:format=>:json}
# new_user_password          GET    /password/new(.:format)   devise/passwords#new {:format=>:json}
# edit_user_password         GET    /password/edit(.:format)  devise/passwords#edit {:format=>:json}
# user_password              PATCH  /password(.:format)       devise/passwords#update {:format=>:json}
#                            PUT    /password(.:format)       devise/passwords#update {:format=>:json}
#                            POST   /password(.:format)       devise/passwords#create {:format=>:json}
# cancel_user_registration   GET    /signup/cancel(.:format)  devise/registrations#cancel {:format=>:json}
# new_user_registration      GET    /signup/sign_up(.:format) devise/registrations#new {:format=>:json}
# edit_user_registration     GET    /signup/edit(.:format)    devise/registrations#edit {:format=>:json}
# user_registration          PATCH  /signup(.:format)         devise/registrations#update {:format=>:json}
#                            PUT    /signup(.:format)         devise/registrations#update {:format=>:json}
#                            DELETE /signup(.:format)         devise/registrations#destroy {:format=>:json}
#                            POST   /signup(.:format)         devise/registrations#create {:format=>:json}
# users                      GET    /users(.:format)          users#index
#                            GET    /users/:id(.:format)      users#show
#                            DELETE /users/:id(.:format)      users#destroy
# root                       GET    /                         users#index

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
  get     '/users/:id',     to: 'users#show'
  delete  '/users/:id',     to: 'users#destroy'

  root to: "users#index"
end
