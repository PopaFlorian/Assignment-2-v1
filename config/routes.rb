Rails.application.routes.draw do
  get 'order_items/create'
  get 'order_items/update'
  get 'order_items/destroy'
  get 'carts/show'
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/contacts', to: 'static_pages#contacts'
  get '/blog', to: 'static_pages#blog'
  get '/service', to: 'static_pages#service'
  get '/new', to: 'products#new'
  post '/filter_price', to: 'static_pages#filter_price', :format => false
  get 'filter_price', to: 'static_pages#filter_price'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/carts', to: 'carts#show'
  get '/orders', to: 'carts#index'
  get '/finish_order', to: 'carts#place_order'

  resources :products
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :carts
  resources :order_items, only: [:create, :update, :destroy]

end
