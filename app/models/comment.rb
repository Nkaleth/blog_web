class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_create :increment_author_comments_count

  private

  def increment_author_comments_count
    post.increment!(:comments_count)
  end
end
