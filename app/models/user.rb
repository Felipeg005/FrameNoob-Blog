class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  def recent_posts
    # A method that returns the 3 most recent posts for a given user.
    User.order(created_at: :asc).limit(3)
  end
end
