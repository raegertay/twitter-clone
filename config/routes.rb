Rails.application.routes.draw do

  root 'pages#home'
  get 'following', to: 'pages#following'
  get 'follower', to: 'pages#follower'

  put '/update_avatar', to: 'users#update_avatar'
  post '/follow/:id', to: 'users#follow', as: 'follow'
  delete '/unfollow/:id', to: 'users#unfollow', as: 'unfollow'

  devise_for :users
  resources :tweets, only: [:create]

end
