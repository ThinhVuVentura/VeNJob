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

  resources :users, only:[:show, :edit, :update] do
    member do
      put "update_password"
      get "favorite_user"
      get "apply_job"
      get "confimation_job"
      put "update_cv"
    end
  end
  resources :categories, only:[:show]
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
  get "tks_page" , to: "static#tks_page"
 	root "home#index"
end
