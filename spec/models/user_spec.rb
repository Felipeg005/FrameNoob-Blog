require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Rudolph', photo: 'link', bio: 'I like more react', posts_counter: 0) }

  describe 'Testing user model creation and validations' do
    it 'Should create a user with correct name' do
      expect(subject.name).to eq('Rudolph')
    end

    it 'Should not be valid withan empty name data type' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'Should not be valid with an incorret integer' do
      subject.posts_counter = -30
      expect(subject).to_not be_valid
    end

    it 'Should not be valid without an integer' do
      subject.posts_counter = ''
      expect(subject).to_not be_valid
    end
  end

  describe 'Test user model methods' do
    it 'Should increment posts_counter after adds a new post' do
      User.update_post_counter(1)
      expect(User.first.posts_counter).to eq(1)
    end

    it 'Should select only three most recent posts' do
      10.times do
        Post.create(author_id: 1, title: 'I like rails', text: 'Great framework', comments_counter: 0, likes_counter: 0)
      end
      expect(User.recent_posts(1).count).to eq(3)
    end
  end
end
