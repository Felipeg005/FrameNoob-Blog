require './rails_helper'

RSpec.describe 'Users', :type => :request do
  it "creates a Widget and redirects to the Widget's page" do
    get '/users'
    expect(response).to be_successful
    expect(response.body).to include('Here is a list of all users')
    # expect(response).to render_template(:index)

    # expect(response).to redirect_to(assigns(:users))
    # follow_redirect!

    # expect(response).to render_template(:index)
    # expect(response.body).to include('Here is a list of all users')
  end

  # it "does not render a different template" do
  #   get ('/users')
  #   expect(response).to_not render_template(:show)
  # end
end