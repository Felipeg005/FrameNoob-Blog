class ApplicationController < ActionController::Base
  def current_user
    # should return the first user from a database
    User.first
  end
end
