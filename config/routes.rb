Rails.application.routes.draw do
  resources :properties do
    member do
      get 'report'
    end
  end
  resources :employees
  resources :companies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
