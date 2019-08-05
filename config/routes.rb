Rails.application.routes.draw do
  root 'home#show'
  post '/', to: 'home#create'
  resources :users, controller: 'user'
  resources :gossips, controller: 'gossip'
  get '/welcome/:first_name/', to: 'welcome#show'
  get '/contact', to: 'contact#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/team', to: 'team#show'
end
