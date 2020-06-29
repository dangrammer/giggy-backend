Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :categories, only: :index
      resources :applications, only: [:index, :create]
      resources :listings, only: [:index, :create, :show, :update, :destroy]
      resources :users, only: [:index, :create, :show, :update, :destroy]
      resources :user_conversations, only: :create #this may require other routes OR not be necessary
      resources :conversations, only: [:index, :create]
      resources :messages, only: :create
      mount ActionCable.server => '/cable'
      post '/login', to: 'login#create'
      get '/profile', to: 'users#profile'
    end
  end  
end
