Rails.application.routes.draw do

  root 'sessions#login'
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#logout' 

  get 'signup', to: 'users#new'

  resources :users, except: [:new] do 
    resources :products
  end
  resources :categories, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
