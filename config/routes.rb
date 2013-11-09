CampBlodgett::Application.routes.draw do
  root to: 'camper_registrations#index'

  devise_for :users

  resources :users

  resources :camp_seasons, except: [:destroy]
  resources :camp_sessions, except: [:destroy]
  resources :cabin_assignments, except: [:destroy]
  resources :cabins, except: [:destroy]
  resources :camper_registrations, except: [:destroy]
  resources :camper_sessions, except: [:destroy]
end
