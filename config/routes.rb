Postit::Application.routes.draw do
  root to: 'posts#index'
  resources :posts do
    resources :comments
  end
  resources :users
  resource :category
end
