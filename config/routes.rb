Rails.application.routes.draw do
   root  to: "pages#home"

   get "/pages/*page" => "pages#home"
   get "home", to: "pages#home"
   get "blog", to: "pages#blog"
   get "about", to: "pages#about"







  resources :properties do
    member do
      get 'report'
    end
  end

  resources :employees
  resources :companies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
