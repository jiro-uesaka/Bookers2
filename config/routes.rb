Rails.application.routes.draw do
  devise_for :users
  # これを一番上に
  
  root to: "homes#top"
  
  get "home/about" => "homes#about", as: "about"
  
  
  resources :users, only: [:show, :edit, :index, :update]
  # get 'users/index'
  # get 'users/show'
  # get 'users/edit'
  resources :books, only: [:show, :edit, :index, :create, :update, :destroy]
  # get 'books/new'
  # get 'books/edit'
  # get 'books/show'
  # get 'books/index'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
