json.extract! comment, :id, :posts_id, :users_id, :Text, :created_at, :updated_at
json.url comment_url(comment, format: :json)
