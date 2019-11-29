Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.ruby'onrails.org/routing.html
  
  root to: 'home#index'
  resources :manufacturers
  resources :subsidiaries
end
