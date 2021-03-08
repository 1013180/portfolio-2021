Rails.application.routes.draw do
  devise_for :users
  root 'shoes#index'
  root to: 'homes#top'
  resources :shoes, only: [:new, :create, :index, :show, :destroy]
  resources :shoe_brands, only: [:index, :create, :edit, :update]
  resources :shoe_sizes, only: [:index, :create, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
