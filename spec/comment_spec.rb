require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'associations' do
    it { should belong_to(:author).class_name('User') }
    it { should belong_to(:post) }
  end

  describe 'callbacks' do
    describe 'after_create' do
      it 'should increment the post comments_counter' do
        author = User.create(name: 'Author')
        post = create(:post, author:)
        create(:comment, post:, author:)
        expect(post.comments_counter).to eq(1)
      end
    end
  end
end
