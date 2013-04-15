RailsStore::Application.routes.draw do

  
  resources :reviews

  # get '/reviews/new/:id', :to => 'reviews#index', :as => 'reviews'
  # get '/reviews', :to =>'reviews#new', :as => :new_review
  # post '/reviews', :to => 'reviews#create'

  get '/products/cart' => 'products#view_cart', :as => :view_cart

  resources :products
  
  post '/products/:id' => 'products#add_to_cart'
  post '/products/:id/remove' => 'products#remove_from_cart', :as => :remove_from_cart

  root :to => 'products#index'
end
