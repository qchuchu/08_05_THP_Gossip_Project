Rails.application.routes.draw do
  root 'home#show'
  resources :users, except: [:edit]
  resources :gossips do
    resources :likes
  end
  resources :comments do
    resources :likes
  end
  resources :cities, only: [:show]
  resources :sessions, only: [:new, :create, :destroy]
  get '/contact', to: 'contact#show'
  get '/team', to: 'team#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
