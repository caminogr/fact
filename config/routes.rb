Rails.application.routes.draw do

  get '/search' => 'top#search'

  resources :events do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:index, :create, :destroy]
    resources :participants, only: [:create, :destroy]
    resources :invitationships, only: [:create, :destroy] do
      collection do
        get :invitable
      end
    end
  end

  devise_for :users

  resources :users, only: [:show] do
    resources :relationships, only: [:create, :destroy] do
      collection do
        get :following
        get :follower
      end
    end
    get '/invitationships/invited' => 'invitationships#invited'
    member do
      get '/favorite_events' => 'favorites#favorited_events'
    end
  end

  resources :groups, only: [:show, :new, :create, :edit, :update]

  root 'events#index'
end
