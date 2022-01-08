class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def new
    @comment = Comment.new
    respond_to do |format|
      format.html { render :new }
    end
  end

  def create
    @user = current_user
    if Comment.new(comment_params).invalid?
      flash[:notice] = 'The comment was not saved for incorrect data'
      redirect_to "/users/#{@user.id}/posts/#{params[:post_id]}"
    else
      @comment = Comment.create!(comment_params.merge!(author_id: current_user))
      respond_to do |format|
        format.json do
          if @comment.save
            render json: { success: true, data: { comment: @comment.text}, status: :created }
          else
            render json: { success: false, data: { error: "not saved", status: 400 } }
          end
        end
        format.html do
          if @comment.save
            # success message
            flash[:success] = 'Post saved successfully'
            # redirect to index
            redirect_to "/users/#{@comment.author_id}/posts/#{@comment.post_id}"
          else
            # error message
            flash.now[:error] = 'Error:  Post could not be saved'
            # render new
            render :new, locals: { post: @comment }
          end
        end
      end
      Post.update_comments_counter(@comment.post_id)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:id, :author_id, :post_id, :text)
  end
end
