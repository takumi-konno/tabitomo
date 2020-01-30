Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, except: [:index] do
    member do
      get :likes
    end
  end
  resources :itineraries, except: [:index] do
    member do
      get :added_bookmarks
    end
  end
  resources :schedules, except: [:index]
  
  resources :bookmarks, only: [:create, :destroy]
end