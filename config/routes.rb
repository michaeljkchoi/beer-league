Rails.application.routes.draw do
  resources :series, shallow: true do
    resources :teams
    resources :games
  end

  resources :players

  devise_for :users
  root 'series#index'
end
