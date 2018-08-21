Rails.application.routes.draw do

  devise_for :admins, controllers: {
        sessions: 'admins/sessions'
      }

  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations',
        passwords: 'users/passwords',
        confirmations: 'users/confirmations'
      }
#----------------User------------

 	resources :home, only:[:index]
 	resources :jobs, only:[:show]

#-------------------------------

#----------------Admin-----------

 	namespace :admins do
 		resources :jobs
 		resources :categories
    root "jobs#index"
 	end

#--------------------------------

 	root "home#index"
end
