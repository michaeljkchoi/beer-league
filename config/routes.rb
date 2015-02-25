Rails.application.routes.draw do
  resources :series, shallow: true do
    get :latest, on: :collection
    resources :teams
    resources :games, except: [:index] do
      post 'close', on: :member
      resources :goals, only: [:new, :create, :edit, :update, :destroy]
    end
  end

  resources :players

  devise_for :users
  root 'series#latest'
end
