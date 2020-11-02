Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  devise_for :comments
  root 'tweets#index'

  devise_for :users
  resources :tweets do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy, :edit, :show, :update]
  end
  
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
