CampBlodgett::Application.routes.draw do
  root to: 'camper_registrations#index'

  devise_for :users

  resources :users

  resources :cabin_assignments, only: [:index]
  resources :camp_sessions, except: [:destroy] do
    resources :departers do
    end
    resources :arrivers do
    end
    resource :cabin_assignments
  end
  resources :camp_seasons, except: [:destroy]
  resources :cabins, except: [:destroy]
  resources :camper_registrations, except: [:destroy]
  resources :camper_sessions, except: [:destroy]
end
