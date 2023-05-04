class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_create :increment_like_posts_count

  private

  def increment_like_posts_count
    post.increment!(:likes_count)
  end
end
