Rails.application.routes.draw do


  devise_for :users

	root to: 'items#index'
  resources :items
  resources :payments
  resources :orders
  resources :carts
  resources :recap_orders, only: [:index]

  resources :users, only: [:show, :edit, :update] do
    resources :avatars, only: [:create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
