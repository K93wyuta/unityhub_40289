Rails.application.routes.draw do
  root to: 'channels#index'
  devise_for :users
  resources :channels do
    resources :tweets, only: [:index, :show, :create]
    resources :events, only: [:index, :new ,:create, :show, :edit ,:update ,:destroy] do
      resources :channel_event_users, only: [:create, :destroy]
    end
    resources :topics, only: [:new ,:create,  :edit ,:update ,:destroy] 
  end
  resource :sessions, only: [:index, :new, :create, :destroy]
  resources :users, only: [:show, :edit ,:update, :destroy]
end
