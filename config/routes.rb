Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users do
    member do
      get :likes
    end
  end
  resources :itineraries do
    member do
      get :added_bookmarks
    end
  end
  resources :schedules
  
  resources :bookmarks, only: [:create, :destroy]
end