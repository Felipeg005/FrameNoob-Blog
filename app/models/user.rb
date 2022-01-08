class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  def self.recent_posts(id)
    # A method that returns the 3 most recent posts for a given user.
    User.find_by_id(id).posts.order(created_at: :asc).limit(3)
  end

  def self.update_post_counter(id)
    # A method that updates the posts counter for a user.
    @user = User.find(id)
    @user.update(posts_counter: (@user.posts_counter + 1))
  end
end
