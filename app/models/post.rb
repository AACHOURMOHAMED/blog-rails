class Post < ApplicationRecord
  belongs_to :users
  has_many :comments
  has_many :likes

  # A method that updates the posts counter for a user.
  def update_user_posts_counter
    user.update(posts_counter: user.posts.count)
  end

  # A method which returns the 5 most recent comments for a given post.
  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  # Title must not be blank
  validates :title, presence: true
  # Title must not exceed 250 characters
  validates :title, length: { maximum: 250 }
  # CommentsCounter must be an integer greater than or equal to zero.
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0 }
  # LikesCounter must be an integer greater than or equal to zero.
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0 }
end
