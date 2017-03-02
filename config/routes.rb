Rails.application.routes.draw do
   get "/pages/*page" => "pages#show"

   get "about", to: "pages#about"

   root "pages#show", page: "home"



  resources :properties
  resources :employees
  resources :companies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
