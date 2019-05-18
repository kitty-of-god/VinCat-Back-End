Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :carts
  resources :chats
  resources :images
  resources :messages
  resources :products
  resources :ratings
  resources :reports
  resources :sales
  resources :tags
  resources :users
end
