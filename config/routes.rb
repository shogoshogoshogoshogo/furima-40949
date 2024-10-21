
Rails.application.routes.draw do
  get 'orders/new'
  get 'orders/create'
  devise_for :users
  root to: "items#index"
  resources :items do
  resources :orders, only: [:index, :create]
end
end