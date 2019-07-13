Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'articles#index'
  resources :articles do
    resources :comments, only: [:create, :new]
  end
  resources :users, only: [:show]
  namespace api do
    resources :articles, only: [:index], defaults: {format: 'json'}
end
