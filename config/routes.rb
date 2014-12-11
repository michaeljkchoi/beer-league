Rails.application.routes.draw do
  resources :series
  resources :players

  devise_for :users
  root 'series#index'
end
