Lab1::Application.routes.draw do

  devise_for :users, :path => 'accounts'  
  
  resources :restaurants do
    resources :reservations
    resources :stars
  end
  
  resources :categories
  
  get 'dashboard', to: 'users#dashboard', as: :dashboard

  root "restaurants#index"
end
