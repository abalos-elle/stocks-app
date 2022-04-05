Rails.application.routes.draw do
  # Set homepage
  root "companies#index"
  
  # Devise routes
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :companies
end
