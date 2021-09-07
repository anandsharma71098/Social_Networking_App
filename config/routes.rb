Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to:'pages#about'
  resources :posts#, only: [:show,:index,:new,:create,:edit,:update,:destroy]
end