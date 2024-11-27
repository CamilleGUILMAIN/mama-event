Rails.application.routes.draw do

  namespace :admin do
      resources :charities
      resources :events
      resources :options
      resources :orders
      resources :participants
      resources :participations
      resources :payments
      resources :teams
      resources :tickets

      root to: "charities#index"
    end
  get 'participants/index'
  get 'participants/show'
  get 'participants/new'
  get 'participants/create'
  get 'participants/update'
  get 'participants/edit'
  get 'participants/destroy'

  get 'event/new'
  get 'event/show'
  devise_for :users
  resources :charities

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"


  resources :participants

  resources :events, only: [:new, :index, :create, :show]

end
