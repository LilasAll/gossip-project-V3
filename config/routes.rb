Rails.application.routes.draw do
  get 'comments/show'
  resources :city
  resources :gossip 
  resources :author
  resources :welcome, only: [:index, :show]
  resources :contact, only: [:index]
  resources :team, only: [:index]
  resources :comment
  resources :sessions, only: [:new, :create, :destroy]
end
