Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :sessions, except: [:destroy]
  resources :users
  resources :posts, only: [:new, :create, :index]
  delete '/logout', to: 'sessions#destroy'
  root 'posts#index'
end
