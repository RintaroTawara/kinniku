Rails.application.routes.draw do
  root to: "welcome#home"
  devise_for :users, controllers: {
        registrations: 'users/registrations'
  }
  resources :users, only: [:show, :index]
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
end
