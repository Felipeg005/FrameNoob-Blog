class ApplicationController < ActionController::Base
  def current_user
    # should return the first user from a database
    get_current_user = User.first
    get_current_user
  end
end
