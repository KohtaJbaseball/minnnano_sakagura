Rails.application.routes.draw do
  patch 'users/out' => 'users#out'
  devise_for :users
  root to: 'homes#top'
  get 'homes/login_top' => 'homes#login_top', as: 'login_top'
  resources :post_drinks, only: [:new, :index, :show, :edit, :create, :update, :destroy]do
    resource :favorites, only: [:create, :destroy]
  end

  resources :users, only: [:edit, :update]
    get 'users/my_page' => 'users#show'
    get 'users/quit' => 'users#quit'
    patch 'users/out' => 'users#out', as: 'out'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
