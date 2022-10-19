json.extract! post, :id, :users_id, :Title, :Text, :CommentsCounter, :LikesCounter, :created_at, :updated_at
json.url post_url(post, format: :json)
