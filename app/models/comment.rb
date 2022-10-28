class Comment < ApplicationRecord
  belongs_to :users, foreign_key: 'user_id', class_name: 'User'
  belongs_to :posts, foreign_key: 'post_id', class_name: 'Post'
  after_save :update_comments_counter

  validates :text, presence: true

  def update_comments_counter
    posts.update(comments_counter: posts.comments_counter + 1)
  end
end
