Rails.application.routes.draw do

  root 'pages#home'
  get 'user/:id', to: 'pages#home', as: 'user'
  get 'user/:id/following', to: 'pages#following', as: 'user_following'
  get 'follower', to: 'pages#follower'
  get 'my_tweets', to: 'pages#my_tweets'
  get 'tag/:id/tweets', to: 'pages#tweets_by_tag', as: 'tweets_by_tag'

  put '/update_avatar', to: 'users#update_avatar'
  post '/follow/:id', to: 'users#follow', as: 'follow'
  delete '/unfollow/:id', to: 'users#unfollow', as: 'unfollow'

  devise_for :users
  resources :tweets, only: [:create, :destroy]

end
