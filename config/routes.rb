Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :new] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end
  # Defines the root path route ("/")
  root "users#index"
  namespace :api do
    namespace :v1 do
      resources :users do
        resources :posts
        resources :comments
      end
    end
  end
end
