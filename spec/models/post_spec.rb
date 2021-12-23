require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(author_id: 1, title: 'I like rails', text: 'Great framework', comments_counter: -1, likes_counter: '') }
  describe 'Testing Post model to behave as expected' do
    it 'Should create a post with correct author_id' do
      expect(subject.author_id).to eq(1)
    end
    it 'Should not be valid without a correct title data type' do
      subject.title = nil
      expect(subject).to_not be_valid
    end
  end
end
