class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'

  def update_post_counter(id, data)
    # A method that updates the posts counter for a user.
    User.find(id).update(likes_counter: data)
  end

  def recent_comments
    # A method which returns the 5 most recent comments for a given post.
    Post.order(created_at: :asc).limit(5)
  end
end
