Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/contacts', to: 'static_pages#contacts'
  get '/blog', to: 'static_pages#blog'
  get '/service', to: 'static_pages#service'
  get '/new', to: 'products#new'
  get '/show', to: 'products#show'
  post '/filter_price', to: 'static_pages#filter_price', :format => false
  get 'filter_price', to: 'static_pages#filter_price'
  resources :products

end
