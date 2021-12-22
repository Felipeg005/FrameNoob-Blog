class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  validates :name, presence: true

  def recent_posts
    # A method that returns the 3 most recent posts for a given user.
    User.order(created_at: :asc).limit(3)
  end

  def self.update_post_counter(id)
    # A method that updates the posts counter for a user.
    @user = User.find(id)
    @user.update(posts_counter: (@user.posts_counter + 1))
  end
end
