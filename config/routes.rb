Rails.application.routes.draw do

  root to: 'home#index'

  devise_for :users
  resources :users

  resources :posts, only: [:index, :show]

  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
