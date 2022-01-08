# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  root to: "home#index"
  get 'home/index'
  devise_for :users, skip: %i[registrations sessions passwords]
  get "/users/", to: "users#index"
  get "/users/:id", to: "users#show"
  get "/users/:id/posts/", to: "posts#index"
  get "/users/:id/posts/:post_id", to: "posts#show"
  get 'users/:id/new', to: 'posts#new', as: 'new_post'
  get 'users/:id/posts/:post_id/new', to: 'comments#new', as: 'new_comment'
  get 'users/:id/posts/:post_id/new_like', to: 'likes#new', as: 'new_like'

  post 'users/:id/new', to: 'posts#create'
  post 'users/:id/posts/:post_id/new', to: 'comments#create'
  post 'users/:id/posts/:post_id/new_like', to: 'likes#create'

  #Endpoints API
  devise_scope :user do
    post 'signup', to: 'registrations#create'
    post 'login', to: 'sessions#create'
  end

  get '/api/users/:id/posts', to: "posts#index"
  get '/api/users/:id/posts/:post_id/comments', to: "posts#show"
  post '/api/users/:id/posts/:post_id/new_comment', to: "comments#create"
end
