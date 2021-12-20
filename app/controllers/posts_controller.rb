class PostsController < ApplicationController
  def index
    @posts = Post.all
    @user = User.find(params[:id])
  end

  def show
    @user = current_user
    @post = Post.find(params[:id])
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

  def new_comment
    @comment = Comment.new
    respond_to do |format|
      format.html { render :new_comment }
    end
  end

  def create_commment
    @user = current_user
    @comment = Comment.create!(comment_params)
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
  
  def post_params
    params.require(:post).permit(:author_id, :title, :text, :comments_counter, :likes_counter)
  end


end
