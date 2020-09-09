Rails.application.routes.draw do
  resources :notes
  resources :rooms
  resources :walls
  resources :boards
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
