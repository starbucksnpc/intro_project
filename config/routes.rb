Rails.application.routes.draw do
  get 'home/about'
  get 'about', to: 'home#about'

  resources :books, only: [:index, :show]
  resources :shorts, only: [:index, :show]
  resources :villains, only: [:index, :show]
  
  root 'books#index'
end
