Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :bikes, only: [ :show ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bikes, only: [ :index, :show ]
  resources :users, only: [:show]
end
