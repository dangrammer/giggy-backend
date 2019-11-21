Rails.application.routes.draw do
  resources :categories
  resources :applications
  resources :listings
  resources :users
  post '/login', to: 'login#create'
end

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html