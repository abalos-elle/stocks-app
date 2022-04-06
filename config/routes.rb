Rails.application.routes.draw do
  get 'home/index'

  # Set homepage
  root "home#index"
  
  # Devise routes
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations'
  }
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :companies
  resources :home
  resources :owned_stocks
  resources :users do
    resources :owned_stocks
  end
end
