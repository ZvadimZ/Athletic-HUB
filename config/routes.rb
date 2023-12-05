Rails.application.routes.draw do

  resources :events do
    resources :teams, only: [:new]
  end

  post '/events/:event_id/teams/:id/apply', to: 'teams#apply', as: :apply_team
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get '/events', to: 'events#index'
  post '/events', to: 'events#create'

  get '/registration', to: 'registration#new'
  post '/registration', to: 'registration#create'
  get '/team/:event_id', to: 'teams#index'

  get '/login', to: 'login#new'
  post '/login', to: 'login#create'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check


  # Defines the root path route ("/")
  # root "posts#index"
end
