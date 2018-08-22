Rails.application.routes.draw do



get "search", to: "home#search"




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

  resources :users, only:[:show, :edit, :update]
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
