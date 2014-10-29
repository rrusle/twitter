Rails.application.routes.draw do
 root :to => 'users#home'

 resources :users
 resources :tweets


 get '/login' => 'session#new'
 post '/login' => 'session#create'
 delete '/login' => 'session#delete'
  
  resources :users do
    member do
      get :following, :followers
    end
  end
resources :relationships,       only: [:create, :destroy]
end

