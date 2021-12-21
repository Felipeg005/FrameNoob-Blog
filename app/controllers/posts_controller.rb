class PostsController < ApplicationController
  def index
    @posts = Post.all
    @user = User.find(params[:id])
  end

  def show
    @post = Post.find(params[:post_id])
  end
    
  def new
    @post = Post.new
    respond_to do |format|
      format.html { render :new }
    end
  end

  def create
    @user = current_user
    @post = Post.create!(post_params)
    respond_to do |format|
      format.html do
          if @post.save
              # success message
              flash[:success] = "Post saved successfully"
              # redirect to index
              redirect_to "/users/#{@post.author_id}/posts"
          else
              # error message
              flash.now[:error] = "Error:  Post could not be saved"
              # render new
              render :new, locals: { post: @post }
          end
      end
    end
  end

  private
  def post_params
    params.require(:post).permit(:author_id, :title, :text, :comments_counter, :likes_counter)
  end
end
