require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_numericality_of(:post_counter).is_greater_than_or_equal_to(0).only_integer }
  end

  describe 'associations' do
    it { should have_many(:posts).with_foreign_key('author_id') }
    it { should have_many(:likes).with_foreign_key('author_id') }
    it { should have_many(:comments).with_foreign_key('author_id') }
  end

  describe '#three_recent_posts' do
    let(:user) { create(:user) }
    let!(:post1) { create(:post, author: user, created_at: 1.day.ago) }
    let!(:post2) { create(:post, author: user, created_at: 2.days.ago) }
    let!(:post3) { create(:post, author: user, created_at: 3.days.ago) }
    let!(:post4) { create(:post, author: user, created_at: 4.days.ago) }

    it 'returns the three most recent posts' do
      expect(user.three_recent_posts).to eq([post1, post2, post3])
    end
  end
end
