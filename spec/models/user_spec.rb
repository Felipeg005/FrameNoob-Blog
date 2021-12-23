require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name:'Rudolph', photo: 'link', bio: 'I like more react', posts_counter: 0) }
  describe 'Testing user model creation and validations' do
    it 'Should create a user with correct name' do
      expect(subject.name).to eq('Rudolph')
    end

    it 'Should not be valid withan empty name data type' do
      subject.name = nil
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

  describe 'Test user model methods' do
    it 'Should select only five most recent users ' do
      10.times do
      user.create(author_id: 1, title: 'I like rails', text: 'Great framework', comments_counter: 0, likes_counter: 0)
      end
      expect(user.recent_comments.count).to eq(5)
    end

    it 'Should increment comment_counter after adds a new comment' do
      user = user.create(id: 1, author_id: 1, title: 'I like rails', text: 'Great framework', comments_counter: 0, likes_counter: 0)
      user.update_comments_counter(1)
      expect(user.first.comments_counter).to eq(1)
    end

    it 'Should increment likes_counter after adds a new like' do
      user = user.create(id: 1, author_id: 1, title: 'I like rails', text: 'Great framework', comments_counter: 0, likes_counter: 0)
      user.update_likes_counter(1)
      expect(user.first.likes_counter).to eq(1)
    end
  end
end
