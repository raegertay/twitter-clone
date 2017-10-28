Rails.application.routes.draw do

  root 'pages#home'
  put '/update_avatar', to: 'users#update_avatar'
  post '/follow/:id', to: 'users#follow', as: 'follow'

  devise_for :users
  resources :tweets, only: [:create]

end
