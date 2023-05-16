class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :name, presence: true
  validates :post_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'

  def three_recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def three_first_posts
    posts.order(created_at: :asc).limit(3)
  end

  def retrieve_all_user_posts
    posts.includes(:comments, comments: :author)
  end
end
