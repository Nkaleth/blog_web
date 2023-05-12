Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :new] do
    resources :posts, only: [:index, :show, :new, :create] do
      post :create_comment, on: :member
    end
  end
  # Defines the root path route ("/")
  root "users#index"
end
