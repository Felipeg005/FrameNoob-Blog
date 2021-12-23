require 'rails_helper'

RSpec.describe Post, type: :model do
  subject {
    Post.new(
    author_id: 1,
    title: 'I like rails',
    text: 'Great framework',
    comments_counter: 0,
    likes_counter: 0
    )
  }
  
  describe 'Testing Post model creation and validations' do
    it 'Should create a post with correct author_id' do
      expect(subject.author_id).to eq(1)
    end

    it 'Should not be valid without a correct title data type' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'Should not be valid without a correct title length' do
      subject.title = 'lorem ipsum' * 250
      expect(subject).to_not be_valid
    end

    it 'Should not be valid with an incorret integer in comments_counter' do
      subject.comments_counter = -30
      expect(subject).to_not be_valid
    end

    it 'Should not be valid with an incorret integer in likes_counter' do
      subject.comments_counter = -3
      expect(subject).to_not be_valid
    end

    it 'Should not be valid with an incorret integer in likes_counter' do
      subject.comments_counter = -3
      expect(subject).to_not be_valid
    end
  end

  describe 'Test post model methods' do
    it 'Should select only five most recent posts ' do
      10.times do
        Post.create(
          author_id: 1,
          title: 'I like rails',
          text: 'Great framework',
          comments_counter: 0,
          likes_counter: 0
        )
      end
      expect(Post.recent_comments.count).to eq(5)
    end

    it 'Should increment comment_counter after adds a new comment' do
      Post.update_comments_counter(1)
      expect(Post.first.comments_counter).to eq(1)
    end

    it 'Should increment likes_counter after adds a new like' do
      Post.update_likes_counter(1)
      expect(Post.first.likes_counter).to eq(1)
    end
  end
end
