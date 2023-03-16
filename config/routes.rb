Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'pages#index'
  # Defines the root path route ("/")
  # root "articles#index"

  resources :posts do
    resources :comments
  end

  resources :likes, only: %i[create destroy]

  get 'friends', to: 'pages#friends'
end
