class User < ApplicationRecord
  has_many :posts, :comments, :likes, foreign_key: 'author_id'

  def user_recent_posts
    
  end
end
