Rails.application.routes.draw do

  authenticated :user do
    root to: 'pages#home', as: :authenticated_root
  end
  root to: redirect('/users/sign_in')
  get 'user/:id/following', to: 'pages#following', as: 'user_following'
  get 'user/:id/follower', to: 'pages#follower', as: 'user_follower'
  get 'user/:id/tweets', to: 'pages#tweets', as: 'user_tweets'
  get 'tag/:id/tweets', to: 'pages#tweets_by_tag', as: 'tweets_by_tag'

  put '/update_avatar', to: 'users#update_avatar'
  post '/follow/:id', to: 'users#follow', as: 'follow'
  delete '/unfollow/:id', to: 'users#unfollow', as: 'unfollow'

  devise_for :users
  resources :tweets, only: [:create, :destroy]

end
