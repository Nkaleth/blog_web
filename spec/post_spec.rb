require 'rails_helper'

RSpec.describe Post, type: :model do
  subject(:post) { described_class.new(title: 'My Post', comments_counter: 0, likes_counter: 0, author:) }
  let(:author) { User.create(name: 'johndoe', post_counter: 0) }

  it 'is valid with valid attributes' do
    expect(post).to be_valid
  end

  it 'is not valid without a title' do
    post.title = nil
    expect(post).not_to be_valid
  end

  it 'is not valid with a title longer than 250 characters' do
    post.title = 'a' * 251
    expect(post).not_to be_valid
  end

  it 'is not valid with a negative comments counter' do
    post.comments_counter = -1
    expect(post).not_to be_valid
  end

  it 'is not valid with a non-integer comments counter' do
    post.comments_counter = 1.5
    expect(post).not_to be_valid
  end

  it 'is not valid with a negative likes counter' do
    post.likes_counter = -1
    expect(post).not_to be_valid
  end

  it 'is not valid with a non-integer likes counter' do
    post.likes_counter = 1.5
    expect(post).not_to be_valid
  end

  it 'belongs to an author' do
    expect(post.author).to eq(author)
  end

  it 'has many comments' do
    expect(post.comments).to be_empty
  end

  it 'has many likes' do
    expect(post.likes).to be_empty
  end

  describe '#five_recent_comments' do
    it 'returns the five most recent comments' do
      post.save
      author = User.create(name: 'Author')
      comment2 = Comment.create!(post:, author:, text: 'Second comment')
      comment3 = Comment.create!(post:, author:, text: 'Third comment')
      comment4 = Comment.create!(post:, author:, text: 'Fourth comment')
      comment5 = Comment.create!(post:, author:, text: 'Fifth comment')
      comment6 = Comment.create!(post:, author:, text: 'Sixth comment')

      expect(post.five_recent_comments).to eq([comment6, comment5, comment4, comment3, comment2])
    end
  end

  describe '#increment_author_posts_count' do
    it 'increments the author posts count' do
      expect { post.save }.to change { author.post_counter }.from(0).to(1)
    end
  end
end
