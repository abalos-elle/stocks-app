Rails.application.routes.draw do
  # Set homepage
  root "home#index"
  
  devise_scope :user do
    get '/settings', to: 'users/registrations#settings'
    patch '/settings', to: 'users/registrations#edit_settings'
    put '/settings', to: 'users/registrations#edit_settings'
  end
  
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
  resources :transactions 
  resources :users do
    member do
      patch :verify
      put :verify
    end
    resources :owned_stocks
  end
 
  # Custom routes
  get '/errors/forbidden', to: 'errors#unapproved', as: 'forbidden'
end
