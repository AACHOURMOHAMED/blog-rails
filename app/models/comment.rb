class Comment < ApplicationRecord
  belongs_to :posts
  belongs_to :users

  # A method that updates the comments counter for a post.
  def update_post_comments_counter
    post.update(comments_counter: post.comments.count)
  end
end
