Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'pages#index'
  # Defines the root path route ("/")
  # root "articles#index"

  resources :posts do
    resources :comments
    resources :likes, only: :index
  end
  get '/user/:id', to: 'users#show', as: 'user'
  resources :likes, only: %i[create destroy]
  get 'close', to: 'pages#close'
  get 'friends', to: 'pages#friends'
  get '/user/:id/posts', to: 'posts#user_posts', as: 'user_posts'
  post '/user/:id/send_invitation', to: 'users#new_invitation', as: 'invite'
end
