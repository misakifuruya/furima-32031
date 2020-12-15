Rails.application.routes.draw do

  devise_for :users
  root to: 'items#index'
  
  resources :item do
  resources :orders, only:[:create, :index]
  end
end
