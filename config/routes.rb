Lab1::Application.routes.draw do

  devise_for :owners
  resources :restaurants do
    resources :reservations
  end

  root "restaurants#index"
end
