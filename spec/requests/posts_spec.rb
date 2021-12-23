require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'Testing posts index action, controller, routes and views' do
    it 'checks if response status was correct' do
      get '/users/1/posts'
      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
    end

    it 'checks if a correct template was rendered' do
      get '/users/1/posts'
      expect(response).to render_template(:index)
    end

    it 'checks if the response body includes correct placeholder text' do
      get '/users/1/posts'
      expect(response.body).to include('Here is a list of posts all posts for the user')
    end

    it 'does not render a different template' do
      get '/users/1/posts'
      expect(response).to_not render_template(:show)
    end
  end

  describe 'Testing posts show action, controller, routes and views' do
    it 'checks if response status was correct' do
      Post.create(id: 1, author_id: 1, title: 'I like rails', text: 'Great framework', comments_counter: 0, likes_counter: 0)
      get '/users/1/posts/1'
      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
    end
    it 'checks if a correct template was rendered' do
      Post.create(id: 1, author_id: 1, title: 'I like rails', text: 'Great framework', comments_counter: 0, likes_counter: 0)
      get '/users/1/posts/1'
      expect(response).to render_template(:show)
    end
    it 'checks if the response body includes correct placeholder text' do
      Post.create(id: 1, author_id: 1, title: 'I like rails', text: 'Great framework', comments_counter: 0, likes_counter: 0)
      get '/users/1/posts/1'
      expect(response.body).to include('Here is the information for Post #1')
    end
    it 'does not render a different template' do
      Post.create(id: 1, author_id: 1, title: 'I like rails', text: 'Great framework', comments_counter: 0, likes_counter: 0)
      get '/users/1/posts/1'
      expect(response).to_not render_template(:index)
    end
  end
end
