Rails.application.routes.draw do
  resources :users
  resources :attractions

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  post "/rides/new", to: "rides#new"

  root 'welcome#home'

end