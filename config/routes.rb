Rails.application.routes.draw do
  devise_for :users, path: '',
  	path_names: {sign_in: 'login', sign_up: 'signup'}, 
  	controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}
 	resources :users
  # get '/categories/:title', to: 'categories#show', as: 'categories'
  # resources :categories, except: :index, except: :show
  resources :categories, param: :title, except: :index
    root 'frames#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
