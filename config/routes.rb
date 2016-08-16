Rails.application.routes.draw do


  get 'reviews/new'

  get 'reviews/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html  
  resources :movies do
    resources :reviews, only: [:new, :create]
  end

  resources :sessions, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create]

  root to: 'movies#index'

end

