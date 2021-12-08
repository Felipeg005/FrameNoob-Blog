class PostsController < ApplicationController
  def index
    @Posts = Post.all
  end

  def show
    puts params
  end
end
