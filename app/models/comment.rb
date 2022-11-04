class Comment < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id', class_name: 'User'
  belongs_to :post, foreign_key: 'post_id', class_name: 'Post'
  after_save :update_comments_counter

  validates :text, presence: true

  def update_comments_counter
    post.update(comments_counter: post.comments.count)
  end
end
