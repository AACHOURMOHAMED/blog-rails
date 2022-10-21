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
end
