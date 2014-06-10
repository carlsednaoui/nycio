Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users, controllers: { registrations: "users/registrations" }, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}

  resources :organizations
  resources :events
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :occurrences
  resources :skills, only: [:new, :create, :destroy, :index]

	namespace :admin do
		get '/organizations', to: 'admin_pages#organizations'
		get '/events', to: 'admin_pages#events'
		get '/users', to: 'admin_pages#users'
		get '/skills', to: 'admin_pages#skills'
		post '/batch_actions', to: 'admin_pages#batch_actions'
		post '/adminify', to: 'admin_pages#adminify'
	end

end
