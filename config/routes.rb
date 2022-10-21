Rails.application.routes.draw do
  resources :likes
  resources :comments
  resources :posts
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # add roots
  root 'users#index'


  
  # Defines the root path route ("/")
  # root "articles#index"
end
