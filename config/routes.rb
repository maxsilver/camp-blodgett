CampBlodgett::Application.routes.draw do
  devise_for :users
  resources :camp_seasons, except: [:destroy] do
    resources :camp_sessions, except: [:destroy]
  end
  resources :cabin_assignments, except: [:destroy]
  resources :cabins, except: [:destroy]
  resources :camper_registrations, except: [:destroy]
end
