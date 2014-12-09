Rails.application.routes.draw do
  resources :series
  devise_for :users
  root 'series#index'
end
