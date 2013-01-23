Til::Application.routes.draw do
  root :to => 'homes#index'

  resources :posts
  resource :session, controller: 'sessions'
  resources :users, controller: 'users'
end
