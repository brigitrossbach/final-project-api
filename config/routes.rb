Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :users, only: [:index, :create, :destroy]
resources :photos, only: [:index, :create, :show, :destroy]
resources :comments, only: [:index, :create, :show, :destroy]
resources :likes, only: [:index, :create, :destroy]
resources :boards, only: [:index, :create, :destroy, :show]
post '/addToBoard', to: 'photo_board#create'
post '/login', to: 'auth#create'
post '/follow', to: 'follow#create'
post '/unfollow', to: 'follow#destroy'
get '/getuser', to: 'users#show'
mount ActionCable.server => '/cable'

end
