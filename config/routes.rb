Postit::Application.routes.draw do
  root to: 'posts#index'

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  resources :posts do
    resources :comments, only: [:create]
  end
  
  resources :users, only: [:create]
  resources :categories
end
