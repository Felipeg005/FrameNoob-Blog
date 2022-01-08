require 'swagger_helper'

RSpec.describe 'api/my', type: :request do
  describe 'Blog Framenoob API' do

    path '/users/1/posts/1/new_comment' do
  
      post 'Creates a comment' do
        tags 'Posts'
        consumes 'application/json'
        parameter name: :comment, in: :body, schema: {
          type: :object,
          properties: {
            id: { type: :integer },
            post_id: { type: :integer },
            text: { type: :string }
          },
          required: [ 'title', 'text' ]
        }
  
        response '201', 'created' do
          let(:comment) { { id: 30, text: 'bar', post_id: 1 } }
          run_test!
        end
  
        response '422', 'invalid request' do
          let(:comment) { { title: 'foo' } }
          run_test!
        end
      end
    end
  
    path '/blogs/{id}' do
  
      get 'Retrieves a blog' do
        tags 'Blogs', 'Another Tag'
        produces 'application/json', 'application/xml'
        parameter name: :id, in: :path, type: :string
  
        response '200', 'blog found' do
          schema type: :object,
            properties: {
              id: { type: :integer },
              title: { type: :string },
              content: { type: :string }
            },
            required: [ 'id', 'title', 'content' ]
  
          # let(:id) { Blog.create(title: 'foo', content: 'bar').id }
          run_test!
        end
  
        response '404', 'blog not found' do
          let(:id) { 'invalid' }
          run_test!
        end
  
        response '406', 'unsupported accept header' do
          let(:'Accept') { 'application/foo' }
          run_test!
        end
      end
    end
  end
end
