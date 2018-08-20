Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
 	resources :home, only:[:index]
 	resources :jobs, only:[:show]
 	root "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
