require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'Testing posts index action, controller, routes and views' do
    it 'checks if response status was correct' do
      get '/users/user_id/posts'
      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
    end
    it 'checks if a correct template was rendered' do
      get '/users/user_id/posts'
      expect(response).to render_template(:index)
    end
    it 'checks if the response body includes correct placeholder text' do
      get '/users/user_id/posts'
      expect(response.body).to include('Here is a list of posts for a given user')
    end
    it 'does not render a different template' do
      get '/users/user_id/posts'
      expect(response).to_not render_template(:show)
    end
  end

  describe 'Testing posts show action, controller, routes and views' do
    it 'checks if response status was correct' do
      get '/users/user_id/posts/post_id'
      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
    end
    it 'checks if a correct template was rendered' do
      get '/users/user_id/posts/post_id'
      expect(response).to render_template(:show)
    end
    it 'checks if the response body includes correct placeholder text' do
      get '/users/user_id/posts/post_id'
      expect(response.body).to include('Here is the information for a given post')
    end
    it 'does not render a different template' do
      get '/users/user_id/posts/post_id'
      expect(response).to_not render_template(:index)
    end
  end
end
