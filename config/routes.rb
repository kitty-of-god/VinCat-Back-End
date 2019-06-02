# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#                user_token POST   /user_token(.:format)                                                                    user_token#create
#             users_current GET    /users/current(.:format)                                                                 users#current
#                     carts GET    /carts(.:format)                                                                         carts#index
#                           POST   /carts(.:format)                                                                         carts#create
#                      cart GET    /carts/:id(.:format)                                                                     carts#show
#                           PATCH  /carts/:id(.:format)                                                                     carts#update
#                           PUT    /carts/:id(.:format)                                                                     carts#update
#                           DELETE /carts/:id(.:format)                                                                     carts#destroy
#                     chats GET    /chats(.:format)                                                                         chats#index
#                           POST   /chats(.:format)                                                                         chats#create
#                      chat GET    /chats/:id(.:format)                                                                     chats#show
#                           PATCH  /chats/:id(.:format)                                                                     chats#update
#                           PUT    /chats/:id(.:format)                                                                     chats#update
#                           DELETE /chats/:id(.:format)                                                                     chats#destroy
#                    images GET    /images(.:format)                                                                        images#index
#                           POST   /images(.:format)                                                                        images#create
#                     image GET    /images/:id(.:format)                                                                    images#show
#                           PATCH  /images/:id(.:format)                                                                    images#update
#                           PUT    /images/:id(.:format)                                                                    images#update
#                           DELETE /images/:id(.:format)                                                                    images#destroy
#                  messages GET    /messages(.:format)                                                                      messages#index
#                           POST   /messages(.:format)                                                                      messages#create
#                   message GET    /messages/:id(.:format)                                                                  messages#show
#                           PATCH  /messages/:id(.:format)                                                                  messages#update
#                           PUT    /messages/:id(.:format)                                                                  messages#update
#                           DELETE /messages/:id(.:format)                                                                  messages#destroy
#          getKind_products GET    /products/getKind(.:format)                                                              products#getKind
#                  products GET    /products(.:format)                                                                      products#index
#                           POST   /products(.:format)                                                                      products#create
#                   product GET    /products/:id(.:format)                                                                  products#show
#                           PATCH  /products/:id(.:format)                                                                  products#update
#                           PUT    /products/:id(.:format)                                                                  products#update
#                           DELETE /products/:id(.:format)                                                                  products#destroy
#                   ratings GET    /ratings(.:format)                                                                       ratings#index
#                           POST   /ratings(.:format)                                                                       ratings#create
#                    rating GET    /ratings/:id(.:format)                                                                   ratings#show
#                           PATCH  /ratings/:id(.:format)                                                                   ratings#update
#                           PUT    /ratings/:id(.:format)                                                                   ratings#update
#                           DELETE /ratings/:id(.:format)                                                                   ratings#destroy
#                   reports GET    /reports(.:format)                                                                       reports#index
#                           POST   /reports(.:format)                                                                       reports#create
#                    report GET    /reports/:id(.:format)                                                                   reports#show
#                           PATCH  /reports/:id(.:format)                                                                   reports#update
#                           PUT    /reports/:id(.:format)                                                                   reports#update
#                           DELETE /reports/:id(.:format)                                                                   reports#destroy
#                     sales GET    /sales(.:format)                                                                         sales#index
#                           POST   /sales(.:format)                                                                         sales#create
#                      sale GET    /sales/:id(.:format)                                                                     sales#show
#                           PATCH  /sales/:id(.:format)                                                                     sales#update
#                           PUT    /sales/:id(.:format)                                                                     sales#update
#                           DELETE /sales/:id(.:format)                                                                     sales#destroy
#                      tags GET    /tags(.:format)                                                                          tags#index
#                           POST   /tags(.:format)                                                                          tags#create
#                       tag GET    /tags/:id(.:format)                                                                      tags#show
#                           PATCH  /tags/:id(.:format)                                                                      tags#update
#                           PUT    /tags/:id(.:format)                                                                      tags#update
#                           DELETE /tags/:id(.:format)                                                                      tags#destroy
#                     users GET    /users(.:format)                                                                         users#index
#                           POST   /users(.:format)                                                                         users#create
#                      user GET    /users/:id(.:format)                                                                     users#show
#                           PATCH  /users/:id(.:format)                                                                     users#update
#                           PUT    /users/:id(.:format)                                                                     users#update
#                           DELETE /users/:id(.:format)                                                                     users#destroy
#                  sessions POST   /sessions(.:format)                                                                      sessions#create
#                   session DELETE /sessions/:id(.:format)                                                                  sessions#destroy
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  #devise_for :users
  post 'user_token' => 'user_token#create'
  get 'users/current' => 'users#current'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, only: []
  resources :carts
  resources :chats
  resources :images
  resources :messages
  resources :products do
    collection do
      get :getKind
      get :getByName
    end
  end
  resources :ratings
  resources :reports do
    collection do
      get :getReportableType
    end
  end
  resources :sales do
    collection do
      get :getDate
    end
  end
  resources :tags do
    collection do
      get :getByTag
    end
  end
  resources :users do
    collection do
      get :getRole
    end
  end
  resources :sessions, only: [:create, :destroy]
end
