class User < ApplicationRecord
  has_many :posts, :comments, :likes, foreign_key: 'author_id'

  def recent_posts
    #A method that returns the 3 most recent posts for a given user.
    self.order(created_at: :asc).limit(3)
  end
end
