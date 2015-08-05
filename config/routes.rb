Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:update]

  resources :registered_applications

  root to: 'welcome#index'
end
