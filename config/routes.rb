Rails.application.routes.draw do
  
  resources :events do
    resources :teams, only: [:new, :create, :index]
  end

  post '/events/:event_id/teams/:id/apply', to: 'teams#apply', as: :apply_team
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  get '/events/new', to: 'events#new'
  post '/events', to: 'events#create'

  root 'home#index'
  get '/welcome', to: 'home#welcome'
  get '/registration', to: 'registration#new'
  post '/registration', to: 'registration#create'
  get '/login', to: 'login#new'
  post '/login', to: 'login#create'
  get '/team', to: 'home#team_overview'
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  

  # Defines the root path route ("/")
  # root "posts#index"
end
