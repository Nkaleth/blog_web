require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'associations' do
    it { should belong_to(:author).class_name('User') }
    it { should belong_to(:post) }
  end

  describe 'callbacks' do
    describe 'after_create' do
      it 'should increment the post likes_counter' do
        author = User.create(name: 'Author')
        post = create(:post, author:)
        create(:like, post:, author:)
        expect(post.likes_counter).to eq(1)
      end
    end
  end
end
