Rails.application.routes.draw do

  devise_for :users, path: '',
  	path_names: {sign_in: 'login', sign_up: 'signup'}, 
  	controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}
  
  resources :users
  resources :categories, param: :title, except: [:index, :show]
  resources :teams, param: :name 

  # get ':team_name', to: 'teams#show'
  post ':team_name', to: 'teams#change_session'
  get ':team_name/:title', to: 'categories#show', as: 'category_display'
  get ':team_name/api/categories', to: 'categories#index', as: 'category_api'
  post '/categories/add_user/:title/:user_id', as: 'category_add_user', to: 'categories#add_user'
  root 'frames#index'

end
