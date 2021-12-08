# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  # resources :users, only: [:index, :show] do
  #   resources :posts, only: [:index, :show]
  # end
  root to: "users#index"
  get "/users/", to: "users#index"
  get "/users/:id", to: "users#show"
  get "/users/:id/posts/", to: "posts#index"
  get "/users/:id/posts/:id", to: "posts#show"
end
