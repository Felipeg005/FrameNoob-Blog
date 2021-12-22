class Comment < ApplicationRecord
  belongs_to :user, :post
  after_save :update_comment_counter

  def update_comment_counter(id, data)
    # A method that updates the comments counter for a post.
    Post.find(id).update(comments_counter: data)
  end
end
