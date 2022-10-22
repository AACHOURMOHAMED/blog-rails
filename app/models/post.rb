class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :users, foreign_key: 'user_id', class_name: 'User'
  after_create :update_posts_counter

  validates :title, presence: true, length: { in: 3..250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def return_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_posts_counter
    users.increment!(:posts_counter)
  end
end
