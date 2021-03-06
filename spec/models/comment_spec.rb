require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { Comment.new(author_id: 1, post_id: 1, text: 'Lorem Ipsum is simply dummy text of the printing') }
  describe 'Testing comment model to behave as expected' do
    it 'Should create a comment with correct author_id' do
      expect(subject.author_id).to eq(1)
    end

    it 'Should create a comment with correct post_id' do
      expect(subject.post_id).to eq(1)
    end

    it 'Should create a comment with correct text' do
      expect(subject.text).to be_kind_of(String)
    end
  end
end
