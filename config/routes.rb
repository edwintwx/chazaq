Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :posts, only: [:new, :create, :edit, :update, :destroy]
  resources :posts, only: [:index, :show] do
    resources :comments, only: [:new, :create]
    resources :hearts, only: [:create]
  end
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :hearts, only: [:destroy]
  resources :comments, only: [:edit, :update, :destroy]
end
