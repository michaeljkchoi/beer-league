Rails.application.routes.draw do
  resources :series do
    resources :teams
  end

  resources :players

  devise_for :users
  root 'series#index'
end
