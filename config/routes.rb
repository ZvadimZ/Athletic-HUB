Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get '/welcome', to: 'pages#welcome'

  get '/registration', to: 'registration#reg'
  post '/registration', to: 'registration#create'

  get '/auth', to: 'auth#reg'
  post '/auth', to: 'auth#create'

  get '/team',to: 'pages#team_overview'
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  

  # Defines the root path route ("/")
  # root "posts#index"
end
