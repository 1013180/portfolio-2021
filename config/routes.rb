Rails.application.routes.draw do
  devise_for :users
  # root 'shoes#index'
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  resources :shoes, only: [:new, :create, :index, :show, :destroy]
  resources :shoe_brands, only: [:index, :create, :edit, :update]
  resources :shoe_sizes, only: [:index, :create, :edit, :update]
  resources :users, only: [:index, :edit, :show, :update] do
     	resource :relationships, only: [:create, :destroy]
  	get 'followings' => 'relationships#followings', as: 'followings'
  	get 'followers' => 'relationships#followers', as: 'followers'
  end
  resources :shoes do
  resources :favorites, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  end

    resources :shoes do
    collection do
      get :search
    end
  end
  post '/homes/guest_sign_in', to: 'homes#new_guest'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
