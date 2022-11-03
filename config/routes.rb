Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'sign_out', to: 'devise/sessions#destroy'
  end
  root to: "users#index"

  resources :users, only: [:index, :show, :new, :create] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:index, :show, :new, :create]
      resources :likes, only: [:new, :create]
    end
  end
end
