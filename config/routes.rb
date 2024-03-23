Rails.application.routes.draw do
  root to: 'channels#index'
  devise_for :users
  resources :cahnnels, only: :index
end
