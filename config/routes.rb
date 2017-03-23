Rails.application.routes.draw do

  devise_for :users, path: '',
  	path_names: {sign_in: 'login', sign_up: 'signup'}, 
  	controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}
  
  namespace :assets do
    :assets
  end
  
  resources :users
  patch '/users/:id', to: 'users#update', as: 'user_picture'
  
  post 'pages/add_file', to: 'pages#add_file', as: 'add_file_to_page'  
  resources :pages, param: :page_slug, except: [:index, :show]
  
  resources :categories, param: :title_slug, except: [:index, :show, :update] 
  post 'categories/add_file', to: 'categories#add_file', as: 'add_file_to_category'
  post '/categories/add_user/:title_slug/:user_id', as: 'category_add_user', to: 'categories#add_user'
  post '/categories/change_title', to: 'categories#change_title', as:'update_category_title'
  post '/categories/order_pages', to: 'categories#order_pages', as:'change_pages_order'

 
  resources :teams, param: :team_slug, except: [:index, :show]
  resources :commits, except: [:index, :show, :new]

  post '/pages/create_version', to: 'pages#create_version', as: 'new_version'
 
  get '/commits/:page_id/:version_id/new', to: 'commits#new', as: 'new_commit'
 
  post '/teams/remove_member', to: 'teams#remove_member'
  get '/teams/find', to: 'teams#find'
 
  get '/bs/:team_slug', to: 'teams#show', as: 'show_team'
  post '/bs/:team_slug', to: 'teams#change_session', as: 'change_session'
 
  get '/api/teams', to: 'teams#index'
  get '/api/categories', to: 'categories#index', as: 'category_api'
  get '/api/pages/:team_slug', to: 'pages#index', as: 'pages_api'
  get '/api/commits', to: 'commits#index', as: 'commits_api'

  get '/bs/:team_slug/:title_slug', to: 'categories#show', as: 'category_display'
  get '/bs/:team_slug/:title_slug/:page_slug', to: 'pages#show', as: 'page_display'
  get '/bs/:team_slug/:title_slug/:page_slug/:version_id', to: 'versions#show', as: 'version_display'
 
  root 'frames#index'

end
