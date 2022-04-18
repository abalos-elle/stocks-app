Rails.application.routes.draw do
  # Set homepage
  root "home#index"
  
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
  resources :transactions do
    post :sell
  end
  resources :users do
    resources :owned_stocks do     
    end
  end
  
  # Custom routes
  get '/errors/forbidden', to: 'errors#unapproved', as: 'forbidden'
end
