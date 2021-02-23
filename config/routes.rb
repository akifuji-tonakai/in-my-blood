Rails.application.routes.draw do
  get 'homes/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#index'
  resources :users, only: :show do
   resources :tags, only: [:index, :new, :create, :show, :destroy]
   resources :urls, only: :destroy
  end
end