CampBlodgett::Application.routes.draw do
  resources :camp_seasons, except: [:destroy] do
    resources :camp_sessions, except: [:destroy]
  end
  resources :cabin_assignments, except: [:destroy]
  resources :cabins, except: [:destroy]
  resources :camper_registrations, except: [:destroy]
end
