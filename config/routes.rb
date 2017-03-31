Rails.application.routes.draw do
  resources :property_names
  resources :unit_types
  resources :properties
   root  to: "pages#home"

   get "/pages/*page" => "pages#home"
   get "home", to: "pages#home"
   get "blog", to: "pages#blog"
   get "about", to: "pages#about"

   get '/login' => 'sessions#new'
   post '/login' => 'sessions#create'
   get '/logout' => 'sessions#destroy'
   get '/renewal' => 'properties#renewal'

   get '/update' => 'properties#update'
   post '/update' => 'properties#submit'

   get '/raw' => 'properties#raw'
   get '/rawren' => 'properties#rawren'



  resources :properties
  #   member do
  #     get 'report'
  #   end
  # end

  resources :employees
  resources :companies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
