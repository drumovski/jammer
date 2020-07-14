Rails.application.routes.draw do
  resources :users
  get 'members/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # A Song || Songs
  # Title:
  # Notes:
  # Lyrics:
  # Tempo:
  # Drum Program: 


  root "songs#index"

  get "songs", to: "songs#index", as: "songs" #index_path
  post "songs", to: "songs#create"
  get "songs/new", to: "songs#new", as: "new_song"
  get "songs/:id", to: "songs#show", as: "song" #song_path(:id)
  get "songs/:id/edit", to: "songs#edit", as: "edit_song"
  patch "songs/:id/", to: "songs#update"
  delete "songs/:id", to: "songs#remove"

  resources :members

end
