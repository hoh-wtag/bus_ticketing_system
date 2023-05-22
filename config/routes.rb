Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  devise_scope :user do
    get ':user/profile', to: 'devise/registrations#edit', as: :edit_user_profile
  end

  resources :routes
  resources :buses
  resources :trips
  resources :boarding_points

  get 'search', to: 'tickets#index', as: 'search'
  get 'book_seats/:id', to: 'tickets#book_seats', as: 'book_seats'
  post 'payment', to: 'tickets#payment', as: 'payment'
  get 'process_payment', to: 'tickets#process_payment'
  post 'confirm_payment', to: 'tickets#confirm_payment'
  get 'dashboard', to: 'users#dashboard', as: 'dashboard'
end
