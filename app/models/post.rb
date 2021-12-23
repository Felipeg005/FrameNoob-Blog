class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'
  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.recent_comments
    # A method which returns the 5 most recent comments for a given post.
    Post.order(created_at: :asc).limit(5)
  end

  def self.update_comments_counter(id)
    # A method that updates the comments counter for a post.
    @post = Post.find(id)
    @post.update(comments_counter: (@post.comments_counter + 1))
  end

  def self.update_likes_counter(id)
    # A method that updates the comments counter for a post.
    @post = Post.find(id)
    @post.update(likes_counter: (@post.likes_counter + 1))
  end
end
