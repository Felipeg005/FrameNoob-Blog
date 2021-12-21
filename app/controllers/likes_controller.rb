class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @user = current_user
    @like = Like.create!(like_params)
    Post.update_likes_counter(@like.post_id)
    redirect_to "/users/#{@like.author_id}/posts/#{@like.post_id}"
  end
    private

    def like_params
      params.require(:like).permit(:author_id, :post_id)
    end
end