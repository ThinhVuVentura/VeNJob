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

  resources :users, only:[:show, :edit, :update] do
    member do
      put "update_password"
      get "favorite_user"
      get "apply_job"
      get "confimation_job"
      put "update_cv"
      get "history_apply"
      get "my_page"
    end
  end

 	resources :home, only:[:index]
 	resources :jobs, only:[:show, :index]
  resources :cities, only:[:show] do
    resources :industries, only:[:show]
  end

#-------------------------------

#----------------Admin-----------

 	namespace :admins do
 		resources :jobs
    resources :users do
      collection {post :import }
    end
    resources :cities
 		resources :industries
    root "jobs#index"
 	end

#--------------------------------
  get "tks_page" , to: "static#tks_page"
 	root "home#index"
end
