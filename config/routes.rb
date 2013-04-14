RailsStore::Application.routes.draw do

  root :to => 'products#index'

  get '/reviews', :to => 'reviews#index', :as => 'reviews'
  post '/reviews', :to => 'reviews#create' 

  resources :products

  post '/products/:id' => 'products#add_to_cart'
  post '/products/:id/remove' => 'products#remove_from_cart', :as => :remove_from_cart

end
