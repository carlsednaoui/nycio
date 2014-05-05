Rails.application.routes.draw do
  root 'pages#events'
  get '/organizations', to: 'pages#organizations'
  get '/events/:id', to: 'pages#show_event', as: 'event'
  get '/organizations/:id', to: 'pages#show_organization', as: 'organization'

  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}

	namespace :admin do
		get '/organizations', to: 'admin_pages#organizations'
		get '/events', to: 'admin_pages#events'
		get '/users', to: 'admin_pages#users'
	end

  resources :organizations
end
