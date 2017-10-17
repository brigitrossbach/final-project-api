Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :users, only: [:index, :create, :show, :destroy]
resources :photos, only: [:index, :create, :show, :destroy]
resources :comments, only: [:index, :create, :show, :destroy]
resources :likes, only: [:index, :create, :destroy]
post '/addToBoard', to: 'photo_board#create'
post '/login', to: 'auth#create'
post '/follow', to: 'follow#create'
post '/unfollow', to: 'follow#destroy'

end
