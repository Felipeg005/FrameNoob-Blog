class ApplicationController < ActionController::Base
  def current_user
    # should return the first user from a database
    current_user = User.first
  end
end
