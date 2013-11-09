CampBlodgett::Application.routes.draw do
  resources :camp_seasons, except: [:destroy]
  resources :cabin_assignments, except: [:destroy]
  resources :cabins, except: [:destroy]
  resources :sessions, except: [:destroy]
  resources :camper_registrations, except: [:destroy]
end
