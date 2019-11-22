Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :categories, only: :index
      resources :applications, only: :index
      resources :listings, only: :index
      resources :users, only: [:index, :create]
      post '/login', to: 'login#create'
      get '/profile', to: 'users#profile'
    end
  end  
end
