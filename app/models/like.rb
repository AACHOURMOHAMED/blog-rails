class Like < ApplicationRecord
  belongs_to :posts
  belongs_to :users

  # A method that updates the likes counter for a post.
  def update_post_likes_counter
    post.update(likes_counter: post.likes.count)
  end
end
