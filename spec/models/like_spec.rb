require 'rails_helper'

RSpec.describe Like, type: :model do
  subject { Like.new(author_id: 1, post_id: 1) }
  describe 'Testing like model to behave as expected' do
    it 'Should create a like with correct author_id' do
      expect(subject.author_id).to eq(1)
    end
    it 'Should create a like with correct post_id' do
      expect(subject.post_id).to eq(1)
    end
  end
end
