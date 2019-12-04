Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.ruby'onrails.org/routing.html
  
  root to: 'home#index'
  resources :manufacturers, only: [:index, :show, :new, :create, :edit, :update]
  resources :subsidiaries, only: [:index, :show, :new, :create, :edit, :update]
  resources :car_categories, only: [:index, :show, :new, :create, :edit, :update]
  resources :clients, only: [:index, :show, :new, :create, :edit, :update]
end
