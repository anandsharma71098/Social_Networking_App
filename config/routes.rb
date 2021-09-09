Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  get 'about', to:'pages#about'
  resources :posts#, only: [:show,:index,:new,:create,:edit,:update,:destroy]
  resources :comments, only: [:new,:create]
  resources :users, only: [:index,:show]
end
