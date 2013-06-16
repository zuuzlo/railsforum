Postit::Application.routes.draw do
  root to: 'posts#index'
  resources :posts do
    resources :comments, only: [:create]
  end
  resources :users
  resources :categories
end
