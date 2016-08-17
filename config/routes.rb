Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html  
  resources :movies do
    resources :reviews, only: [:new, :create]
  end

  resource :session, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create]

  namespace :admin do
    resources :users
  end 

  root to: 'movies#index'

end

