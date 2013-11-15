Lab1::Application.routes.draw do

  devise_for :owners
  resources :restaurants, :reservations

  root "restaurants#index"
end
