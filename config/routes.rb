Rails.application.routes.draw do
  devise_for :admins, controllers: {
        sessions: 'admin/sessions'
      }
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations',
        passwords: 'users/passwords',
        confirmations: 'users/confirmations'

      }
 	resources :home, only:[:index]
 	resources :jobs, only:[:show]

 	namespace :admin do
 		resources :jobs
 		resources :categories
 	end
 	root "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
