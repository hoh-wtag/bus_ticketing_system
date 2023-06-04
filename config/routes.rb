Rails.application.routes.draw do
  resources :routes
  resources :buses
  resources :trips
  resources :boarding_points

  root to: 'users#index'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  delete 'signout', to: 'sessions#destroy'
  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
end
