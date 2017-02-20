Rails.application.routes.draw do

  devise_for :users, path: '',
  	path_names: {sign_in: 'login', sign_up: 'signup'}, 
  	controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}
  
  resources :users
  resources :categories, param: :title, except: [:index, :show]
  resources :teams, param: :name do
  	resources :categories, param: :title, only: [:index, :show]
  end 

  get ':team_name/:title', to: 'categories#show', as: 'category_display'

  post '/categories/add_user/:title/:user_id', as: 'category_add_user', to: 'categories#add_user'
  root 'frames#index'

end
