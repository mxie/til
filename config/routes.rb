Til::Application.routes.draw do
  root :to => 'homes#index'

  resources :posts
  resource :session, controller: 'sessions'
  resources :users, controller: 'users'

  match 'sign_in' => 'homes#index', as: 'sign_in'
  match 'sign_out' => 'sessions#destroy', as: 'sign_out', via: :delete
end
