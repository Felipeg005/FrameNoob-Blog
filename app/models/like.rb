class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_likes_counter(id, data)
    # A method that updates the comments counter for a post.
    Post.find(id).update(comments_counter: data)
  end
end
