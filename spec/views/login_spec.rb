require 'rails_helper'

RSpec.describe Comment, type: :view do
  subject { Comment.new(author_id: 1, post_id: 1, text: 'Lorem Ipsum is simply dummy text of the printing') }
  describe 'Testing comment model to behave as expected' do
    it 'checks if the response body includes correct placeholder text' do
      get '/users/1/posts'
      expect(response.body).to include('Here is a list of posts all posts for the user')
    end
  end
end
