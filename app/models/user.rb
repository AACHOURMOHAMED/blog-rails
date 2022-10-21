class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comments

  # method that returns the 3 most recent posts for a given user.
  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  # Name must not be blank
  validates :name, presence: true
  # PostCounter must be greater than or equal to 0
  validates :post_counter, numericality: { greater_than_or_equal_to: 0 }
end
