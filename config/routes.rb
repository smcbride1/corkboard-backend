Rails.application.routes.draw do
  resources :notes, only: [:create, :show, :edit, :destroy]
  resources :boards, only: [:create, :show, :edit, :destroy]
  resources :users, only: [:create, :show, :edit, :destroy]
  
  post "login", to: "sessions#create"
  post "logout", to: "sessions#destroy"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
