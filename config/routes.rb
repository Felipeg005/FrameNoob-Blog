# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  root to: "users#index"
  get "/users/", to: "users#index"
  get "/users/:id", to: "users#show"
  get "/users/:id/posts/", to: "posts#index"
  get "/users/:id/posts/:post_id", to: "posts#show"
  get 'users/:id/new', to: 'posts#new', as: 'new_post'
  get 'users/:id/posts/:post_id/new', to: 'comments#new', as: 'new_comment'

  post 'users/:id/new', to: 'posts#create'
  post 'users/:id/posts/:post_id/new', to: 'comments#create'
end
