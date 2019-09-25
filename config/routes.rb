Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :bikes, only: [:index, :show, :new, :create ] do
    resources :bookings, only: [:new, :create, :update]
  end
  resources :users, only: [:show]
end
