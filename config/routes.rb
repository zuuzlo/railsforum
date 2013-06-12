Postit::Application.routes.draw do
  root to: 'posts#index'
  resources :posts
  resources :users
  resource :category
end
