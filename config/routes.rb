Rails.application.routes.draw do

  devise_for :users, path: '',
  	path_names: {sign_in: 'login', sign_up: 'signup'}, 
  	controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}
  
  resources :users
  resources :teams, param: :name, except: :index do
  	resources :categories, param: :title #, except: :index
  end 

  post '/categories/add_user/:title/:user_id', as: 'category_add_user', to: 'categories#add_user'
  root 'frames#index'

end
