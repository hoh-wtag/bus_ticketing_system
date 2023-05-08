Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :routes
  resources :buses
  resources :trips
  
  root to: "home#index";
  get "signup", to: "users#new";
  post "signup", to: "users#create";
  delete "signout", to: "sessions#destroy";
  get "signin", to: "sessions#new";
  post "signin", to: "sessions#create";
end
