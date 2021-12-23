class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @user = current_user
    @like = Like.create!(like_params)
    Post.update_likes_counter(@like.post_id)
    redirect_to "/users/#{@like.author_id}/posts/#{@like.post_id}"
    if @like.save
      # success message
      flash[:success] = 'Like saved successfully'
    else
      # error message
      flash.now[:error] = 'Error:  Like could not be saved'
    end
  end

  private

  def like_params
    params.require(:like).permit(:author_id, :post_id)
  end
end
