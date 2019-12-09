Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.ruby'onrails.org/routing.html
  
  root to: 'home#index'
  resources :manufacturers, only: [:index, :show, :new, :create, :edit, :update]
  resources :subsidiaries, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :car_categories, only: [:index, :show, :new, :create, :edit, :update]
  resources :clients, only: [:index, :show, :new, :create, :edit, :update]
  resources :car_models, only: [:index, :show, :new, :create, :edit, :update]
  resources :rentals, only: [:index, :show, :new, :create, :edit, :update]
  resources :cars, only: [:index, :show, :new, :create]
end
