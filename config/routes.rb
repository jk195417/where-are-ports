Rails.application.routes.draw do
  resources :anchor_groups
  root to: 'pages#index'
  resources :anchors
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
