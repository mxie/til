Til::Application.routes.draw do
  root :to => 'homes#index'

  resources :posts, only: [:index, :create, :destroy]
  resource :session, controller: 'sessions', only: [:create, :new, :destroy]
  resources :users, controller: 'users', only: [:create, :new, :index, :show]
  resources :tags, only: [:index, :show]

  match 'sign_in' => 'homes#index', as: 'sign_in'
  delete 'sign_out' => 'sessions#destroy', as: 'sign_out'
end
