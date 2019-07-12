Rails.application.routes.draw do
  root to: "welcome#home"
  devise_for :users, controllers: {
        registrations: 'users/registrations'
  }
  
  resources :users, only: [:show, :index] do
    member do
      get :following, :followers
    end
  end

  resources :posts do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end

  resources :relationships, only: [:create, :destroy]
end
