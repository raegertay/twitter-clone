Rails.application.routes.draw do

  root 'pages#home'
  put '/update_avatar', to: 'users#update_avatar'

  devise_for :users
  resources :tweets, only: [:create]

end
