class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  def recent_posts
    # A method that returns the 3 most recent posts for a given user.
    User.order(created_at: :asc).limit(3)
  end

  def self.update_post_counter(id)
    # A method that updates the posts counter for a user.
    User.find(id).update(posts_counter: (User.sum(:posts_counter) + 1))
  end
end
