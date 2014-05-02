Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users

	namespace :admin do
		get '/organizations', to: 'admin_pages#organizations'
		get '/events', to: 'admin_pages#events'
	end
end
