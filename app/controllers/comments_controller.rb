class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    respond_to do |format|
      format.html { render :new }
    end
  end

  def create
    @user = current_user
    @comment = Comment.create!(comment_params)
    respond_to do |format|
      format.html do
        if @comment.save
            # success message
            flash[:success] = "Post saved successfully"
            # redirect to index
            redirect_to "/users/#{@comment.author_id}/posts/#{@comment.post_id}"
        else
            # error message
            flash.now[:error] = "Error:  Post could not be saved"
            # render new
            render :new, locals: { post: @comment }
        end
      end
    end
  end
    private

    def comment_params
      params.require(:comment).permit(:author_id, :post_id, :text)
    end
end