Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  get 'users/current' => 'users#current'
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
