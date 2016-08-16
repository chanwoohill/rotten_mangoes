Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :movies
  resources :users, only: [:new, :create]
end

