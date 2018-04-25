Rails.application.routes.draw do

  #---------------------- Session routes -------------------
  post 'sessions/create' => 'sessions#create'
  delete 'sessions/destroy' => 'sessions#destroy'

  #---------------------- User routes -------------------
  get 'main' => 'users#index'
  post 'users/create' => 'users#create'
  get 'dashboard/:id' => 'users#show'
  get 'users/:id' => 'users#playlist'
  patch 'users/add/:song_id' => "users#add"

 #---------------------- Song routes -------------------
  get 'songs/' => 'songs#dashboard'
  post 'songs/create' => 'songs#create'
  get 'songs/:song_id' => 'songs#stats'
  
  # get 'products/:product_id' => 'products#buy'
  # delete 'products/delete/:product_id' => 'products#delete'
  # post 'products/create' => 'products#create'

end
