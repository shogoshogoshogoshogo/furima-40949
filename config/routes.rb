Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :comments
  end
  resources :users, only: [:show]
  resources :items, only: [:new, :create]
end
