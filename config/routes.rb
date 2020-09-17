Rails.application.routes.draw do
  resources :notes, only: [:create, :show, :update, :destroy]
  resources :boards, only: [:create, :show, :update, :destroy]
  resources :users, only: [:create, :show, :update, :destroy]
  
  resources :users do
    resources :boards, only: [:index]
  end

  resources :boards do
    resources :notes, only: [:index]
  end

  post "login", to: "sessions#create"
  post "logout", to: "sessions#destroy"
  get "current_user", to: "sessions#current_user_info"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
