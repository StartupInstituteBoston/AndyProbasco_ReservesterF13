Lab1::Application.routes.draw do

  devise_for :owners
  resources :restaurants do
    resources :reservations
  end
  
  resources :categories
  
  get 'dashboard', to: 'owners#dashboard', as: :dashboard

  root "restaurants#index"
end
