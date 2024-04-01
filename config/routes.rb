Rails.application.routes.draw do
  root to: 'channels#index'
  devise_for :users
  resources :channels do
    resources :tweets, only: [:index]
  end
  resource :sessions, only: [:index, :new, :create, :destroy]
  resources :users, only: [:show, :edit ,:update, :destroy]
end
