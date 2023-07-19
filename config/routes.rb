Rails.application.routes.draw do
  devise_for :accounts
  root 'pages#index'
  resources :books
  resources :authors
end
