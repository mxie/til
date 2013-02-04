Til::Application.routes.draw do
  root :to => 'homes#index'

  resources :posts
  resource :session, controller: 'sessions', only: [:create, :new, :destroy]
  resources :users, controller: 'users'
  resources :tags, only: [:index]

  match 'sign_in' => 'homes#index', as: 'sign_in'
  delete 'sign_out' => 'sessions#destroy', as: 'sign_out'
end
