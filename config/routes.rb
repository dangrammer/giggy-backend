Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :categories, only: :index
      resources :applications, only: [:index, :create]
      resources :listings, only: [:index, :show]
      resources :users, only: [:index, :create, :show]
      post '/login', to: 'login#create'
      get '/profile', to: 'users#profile'
    end
  end  
end
