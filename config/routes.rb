Rails.application.routes.draw do
  root 'home#show'
  post '/', to: 'home#create'
  resources :users
  resources :gossips
  resources :comments
  resources :likes
  resources :cities
  get '/contact', to: 'contact#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/team', to: 'team#show'
end
