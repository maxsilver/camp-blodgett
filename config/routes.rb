CampBlodgett::Application.routes.draw do
  root to: 'camper_registrations#index'

  devise_for :users

  resources :users

  resources :camp_seasons, except: [:destroy]
  resources :cabin_assignments, only: [:index]
  resources :camp_sessions, except: [:destroy] do
    resource :cabin_assignments
  end
  resources :cabins, except: [:destroy]
  resources :camper_registrations, except: [:destroy]
  resources :camper_sessions, except: [:destroy]
end
