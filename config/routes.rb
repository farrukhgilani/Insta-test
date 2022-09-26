Rails.application.routes.draw do
  resources :follows
  devise_for :users
  root to: 'posts#index'

  resources :users do
    member do
      get :show
      get :account
      get :cancel
      get :accept
      post :follow
      post :unfollow
    end
    resources :stories
  end

  resources :posts do
    member do
      get :like
    end
    resources :comments
  end


end
