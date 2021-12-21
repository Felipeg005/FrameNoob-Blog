class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'

  def recent_comments
    # A method which returns the 5 most recent comments for a given post.
    Post.order(created_at: :asc).limit(5)
  end

  def self.update_comments_counter(id)
    # A method that updates the comments counter for a post.
    Post.find(id).update(comments_counter: (User.sum(:comments_counter) + 1))
  end

  def self.update_likes_counter(id)
    # A method that updates the comments counter for a post.
    Post.find(id).update(likes_counter: (User.sum(:likes_counter) + 1))
  end
end
