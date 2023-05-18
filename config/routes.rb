Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  resources :routes
  resources :buses
  resources :trips
  resources :boarding_points
  
end
