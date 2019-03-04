Rails.application.routes.draw do
  # get 'requests/index'
  # get 'requests/create'
  devise_for :users
  root to: 'custodies#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :messages, only: [:index, :create]

  root to: 'custodies#index'

  resources :custodies, only: [:index, :show, :new, :create, :edit, :update]
  resources :media, only: [:index, :show, :new, :create, :destroy]
  resources :users, except: [:index, :new, :create, :show, :edit]

  get :profile, to: 'users#profile'
  get :edit_profile, to: 'users#edit_profile'

end
