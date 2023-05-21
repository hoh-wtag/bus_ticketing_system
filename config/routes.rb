Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  resources :routes
  resources :buses
  resources :trips
  resources :boarding_points

  get 'search', to: 'tickets#index', as: 'search'
  get 'seat_plan/:id', to: 'tickets#seat_plan', as: 'seat_plan'
  post 'payment', to: 'tickets#payment', as: 'payment'
  get 'process_payment', to: 'tickets#process_payment'
  post 'confirm_payment', to: 'tickets#confirm_payment'
  
end
