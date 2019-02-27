Rails.application.routes.draw do
  get 'requests/index'
  get 'requests/create'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :residencies
  resources :events
  resources :conversations, only: [:index, :create] do
    resources :requests, only: [:index, :create]
  end
end
