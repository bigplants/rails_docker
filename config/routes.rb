Rails.application.routes.draw do
  resources :users
  resources :microposts
  root 'users#index'
end
