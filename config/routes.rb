# ---------------------------------------------------------------------------------------------------------
# Prefix Verb                URI Pattern                              Controller#Action
# ---------------------------------------------------------------------------------------------------------
# new_user_session           GET    /login                            sessions#new {:format=>:json}
# user_session               POST   /login                            sessions#create {:format=>:json}
# destroy_user_session       DELETE /logout                           sessions#destroy {:format=>:json}
# new_user_password          GET    /password/new                     devise/passwords#new {:format=>:json}
# edit_user_password         GET    /password/edit                    devise/passwords#edit {:format=>:json}
# user_password              PATCH  /password                         devise/passwords#update {:format=>:json}
#                            PUT    /password                         devise/passwords#update {:format=>:json}
#                            POST   /password                         devise/passwords#create {:format=>:json}
# cancel_user_registration   GET    /signup/cancel                    devise/registrations#cancel {:format=>:json}
# new_user_registration      GET    /signup/sign_up                   devise/registrations#new {:format=>:json}
# edit_user_registration     GET    /signup/edit                      devise/registrations#edit {:format=>:json}
# user_registration          PATCH  /signup                           devise/registrations#update {:format=>:json}
#                            PUT    /signup                           devise/registrations#update {:format=>:json}
#                            DELETE /signup                           devise/registrations#destroy {:format=>:json}
#                            POST   /signup                           devise/registrations#create {:format=>:json}
# users                      GET    /users                            users#index
#                            GET    /users/:id                        users#show
#                            DELETE /users/:id                        users#destroy
# countries_quiz             POST   /countries/quiz                   countries#suggestVacationDestinations
#                            GET    /countries/:country_id/pois       point_of_interests#fetchCountryPointsOfInterest
# users_favorites            GET    /favorites                        users_favorites#fetchUsersFavorites
#                            POST   /favorites                        users_favorites#create
#                            DELETE /favorites                        users_favorites#destroy
# root                       GET    /                                 users#index

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

  get     '/users',     to: 'users#index'
  get     '/users/:id', to: 'users#show'
  delete  '/users/:id', to: 'users#destroy'

  post     '/countries/quiz',             to: 'countries#suggestVacationDestinations'
  get      '/countries/:country_id/pois', to: 'point_of_interests#fetchCountryPointsOfInterest'

  get      '/favorites', to: 'users_favorites#fetchUsersFavorites'
  post     '/favorites', to: 'users_favorites#create'
  delete   '/favorites', to: 'users_favorites#destroy'

  root to: "users#index"
end
