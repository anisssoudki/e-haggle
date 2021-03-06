Rails.application.routes.draw do

  root 'homepage#home'
  get '/about', to: 'homepage#about'
  get '/terms', to: 'homepage#terms'

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#logout'

  get 'signup', to: 'users#new'

  resources :users, except: [:new] do 
    resources :products do 
      member do 
        put "like" => "products#like"
      end
  end
end
  resources :categories, except: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
