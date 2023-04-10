Rails.application.routes.draw do
  devise_for :users

  root to: "videos#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :sounds, only: [:index]
  resources :mixes, except: [:edit, :update]
  get "/mymix", to: "mixes#mymix"
  resources :videos, only: [:index]
end
