Rails.application.routes.draw do

  devise_for :users

	root to: 'items#index'
  resources :items
  resources :payments
  resources :orders
  resources :carts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
