Rails.application.routes.draw do
  resources :infos, only: %i[new create] do
    member do
      post 'vote'
    end
  end
  resources :anchor_groups
  root to: 'pages#index'
  get 'map', to: 'pages#map'
  get 'solutions', to: 'pages#solutions'
  resources :anchors
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
