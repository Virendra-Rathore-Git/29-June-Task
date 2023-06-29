Rails.application.routes.draw do
  # get 'users/:status' , to: 'users#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"

  resources :users 

  get '/users_data/:status', to: 'users#show_data'
  
  get '/users_log/login_user', to: 'users#show_log_data'

  post '/log', to: 'users#log'


end
