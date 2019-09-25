Rails.application.routes.draw do
  get 'bookings/new'
  devise_for :users
  root to: 'pages#home'
  resources :bikes, only: [ :show, :new, :create ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bikes, only: [ :index, :show ]

end
