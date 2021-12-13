class User < ApplicationRecord
  has_many :posts, :comments, :likes, foreign_key: 'author_id'

  def user_recent_posts
    #A method that returns the 3 most recent posts for a given user.
    User.order("created_at ASC").limit(3)
  end
end
