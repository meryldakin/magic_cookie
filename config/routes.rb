Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  #Sessions
  get '/', to: 'sessions#index', as: 'home'
  get '/login', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create'

  #Users
  get '/users', to: 'users#index'
  get '/users/new', to: 'users#new'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users/:id/edit', to: 'users#edit'
  patch '/users/:id', to: 'users#update'

  #Games
  get '/games/new', to: 'games#new'
  post '/games', to: 'games#create', as: 'create_game'
  get '/games/:id', to: 'games#show', as: 'game'
  # post '/answer', to: 'games#answer', as: 'answer'
  patch '/games/:id', to: 'games#update', as: 'game_update'



end
