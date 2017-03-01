Rails.application.routes.draw do

  devise_for :users, path: '',
  	path_names: {sign_in: 'login', sign_up: 'signup'}, 
  	controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}
  
  resources :users
  resources :pages, param: :page_slug, except: [:index, :show]
  resources :categories, param: :title_slug, except: [:index, :show]
  resources :teams, param: :team_slug, except: [:index, :show]
  resources :commits, except: [:index, :show, :new]
  get '/commits/:page_id/:version_id/new', to: 'commits#new'
  post '/teams/remove_member', to: 'teams#remove_member'
  get '/teams/find', to: 'teams#find'
  get '/api/teams', to: 'teams#index'
  get ':team_slug', to: 'teams#show'
  post ':team_slug', to: 'teams#change_session', as: 'change_session'
  get ':team_slug/:title_slug', to: 'categories#show', as: 'category_display'
  get ':team_slug/:title_slug/:page_slug', to: 'pages#show', as: 'page_display'

  get ':team_slug/api/categories', to: 'categories#index', as: 'category_api'
  post '/categories/add_user/:title_slug/:user_id', as: 'category_add_user', to: 'categories#add_user'
  root 'frames#index'

end
