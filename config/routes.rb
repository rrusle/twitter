Rails.application.routes.draw do
 root :to => 'users#index'

 resources :users
 resources :tweets

 get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#delete'
end

