Rails.application.routes.draw do
  # get 'requests/index'
  # get 'requests/create'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :messages, only: [:index, :create]
  resources :custodies, only: [:index, :show, :new, :create, :edit, :update]
  resources :media, only: [:index, :show, :new, :create, :destroy]
end
