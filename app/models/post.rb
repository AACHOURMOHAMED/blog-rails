class Post < ApplicationRecord
  has_many :comments, foreign_key: 'post_id', dependent: :destroy
  has_many :likes, foreign_key: 'post_id', dependent: :destroy
  belongs_to :user, foreign_key: 'user_id', class_name: 'User'
  after_create :update_posts_counter

  validates :title, presence: true, length: { in: 3..250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def return_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_posts_counter
    user.update(posts_counter: user.posts.count)
  end
end
