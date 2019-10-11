Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :posts, only: [:new, :create, :edit, :update, :destroy]

  resources :posts, only: [:index, :show] do
    resources :comments, only: [:new, :create]
    resources :hearts, only: [:create]
  end

  # match :follow, to: 'follows#create', as: :follow, via: :post
  # match :unfollow, to: 'follows#destroy', as: :unfollow, via: :post

  resources :users, only: [:show] do
    resources :follows, only: [:create, :destroy]
    get 'followers', to: 'users#followers', as: :followers
    get 'following', to: 'users#following', as: :following
  end


  resources :users, only: [:edit, :update, :create, :destroy]

  resources :hearts, only: [:destroy]
  resources :comments, only: [:edit, :update, :destroy]


end
