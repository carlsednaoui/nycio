Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}

  resources :organizations

	namespace :admin do
		get '/organizations', to: 'admin_pages#organizations'
		get '/events', to: 'admin_pages#events'
		get '/users', to: 'admin_pages#users'
	end
end
