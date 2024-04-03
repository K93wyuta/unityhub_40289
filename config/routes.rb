Rails.application.routes.draw do
  root to: 'channels#index'
  devise_for :users
  resources :channels do
    resources :tweets, only: [:index, :show, :create]
    resources :topics, only: [:new ,:create,  :edit ,:update ,:destroy] 
    resources :albums
    resources :chats, only: [:index] 
    resources :events do
      resources :channel_event_users, only: [:create, :destroy]
    end
  end
  resource :sessions, only: [:index, :new, :create, :destroy]
  resources :users, only: [:show, :edit ,:update, :destroy]
end
