json.extract! user, :id, :name, :Photo, :Bio, :PostsCounter, :created_at, :updated_at
json.url user_url(user, format: :json)
