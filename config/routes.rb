Rails.application.routes.draw do
  root 'items#index'
  resources :items, only: [:new, :index ]
end