Rails.application.routes.draw do
  resources :items
  root to: 'items#index'
  devise_for :users
end
