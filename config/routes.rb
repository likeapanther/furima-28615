Rails.application.routes.draw do
  resources :items do
    resources :purchase, only: [:index, :create]
  end
  root to: 'items#index'
  devise_for :users
end
