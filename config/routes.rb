Rails.application.routes.draw do

  resources :follows
  devise_for :users
  root to: 'posts#index'
  get '/posts/:id/likes', to: 'posts#like', as: 'like'
  get '/users/:id', to: 'users#show', as:'user'

  get '/user/:id', to: 'users#account', as:'user_type'

  post '/users/:id/follow', to: "users#follow", as: "follow_user"
  post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"

  # resources :users#, only:[:show]
  resources :posts do
    resources :comments
  end


end
