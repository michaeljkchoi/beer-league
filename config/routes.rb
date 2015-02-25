Rails.application.routes.draw do
  resources :series, shallow: true do
    resources :teams
    resources :games do
      post 'close', on: :member
      resources :goals, only: [:new, :create, :edit, :update, :destroy]
    end
  end

  resources :players

  devise_for :users
  root 'series#index'
end
