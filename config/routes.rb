Rails.application.routes.draw do
  devise_for :users
  root to: 'residencies#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :residencies
  resources :conversations, only: [:index, :create] do
    resources :requests, only: [:index, :create]
  end

  resources :events, only: [:index, :show]
end
