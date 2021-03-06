Rails.application.routes.draw do

  resources :meetings
  devise_for :users
  root to: 'home#top'
  get "home/about" => "home#about"
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :edit, :update, :index]

end



