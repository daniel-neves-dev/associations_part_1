Rails.application.routes.draw do
  root 'pages#index'
  resources :books
  resources :authors
end
