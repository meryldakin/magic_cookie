Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  #Sessions
  get '/login', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create', as: 'create_login'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  #Users
  get '/users', to: 'users#index'
  get '/users/new', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  patch '/users/:id', to: 'users#update'

  #UserGames
  get '/user_games/:user_id', to: 'user_games#index', as: 'user_games'
  get '/user_games/:user_id/:game_id', to: 'user_games#show', as: 'user_game'

  #Games
  get '/games/new', to: 'games#new'
  post '/games', to: 'games#create', as: 'create_game'
  get '/games/:id', to: 'games#show', as: 'game'
  get '/games/:id/play', to: 'games#play', as: 'play_game'
  patch '/games/:id', to: 'games#update', as: 'game_update'
  get '/games/:id/game_over', to: 'games#game_over', as: 'game_over'

  #UserFortunes
  get '/user_fortunes/:user_id', to: 'user_fortunes#index', as: 'user_fortunes'

  #Static
  get '/', to: 'static_pages#home', as: 'home'
  get '/about', to: 'static_pages#about', as: 'about'
  get '/ready', to: 'static_pages#ready', as: 'ready'


end
