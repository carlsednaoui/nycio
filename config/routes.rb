Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users

	namespace :admin do
		get '/organizations', to: 'admin_pages#organizations'
	end
end
