Rails.application.routes.draw do
  root to: 'channels#index'
  devise_for :users
  resources :channels, only: [:index, :new, :create, :show, :edit, :update]
  resource :sessions, only: [:index, :new, :create, :destroy]
end
