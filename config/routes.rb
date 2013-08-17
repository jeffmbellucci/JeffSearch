Jeffsearch::Application.routes.draw do
  resources :users 
  resources :searches
  resource :sessions, :only => [:new, :create, :destroy]
  root to: 'homepage#show'
end