class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  after_create :increment_author_posts_count

  def five_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def increment_author_posts_count
    author.increment!(:posts_count)
  end
end
