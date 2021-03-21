Rails.application.routes.draw do
  devise_for :users
  # root 'shoes#index'
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  root to: 'plans#index'
  resources :plans
  resources :shoes, only: %i[new create index show destroy edit update]
  resources :shoe_brands, only: %i[index create edit update]
  resources :shoe_sizes, only: %i[index create edit update]
  resources :users, only: %i[index edit show update] do
    resource :relationships, only: %i[create destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  resources :shoes do
    resources :favorites, only: %i[create destroy]
    resources :comments, only: %i[create destroy]
  end

  resources :shoes do
    collection do
      get :search
    end
  end
  post '/homes/guest_sign_in', to: 'homes#new_guest'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
