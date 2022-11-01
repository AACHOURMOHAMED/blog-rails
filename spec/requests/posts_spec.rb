require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:each) do
    @user =
      User.create(
        name: 'Julie',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'I am a renowned teached from Mexico. I enjoy my work very much.',
        posts_counter: 3
      )

    @post =
      Post.create(
        user: @user,
        title: 'My first post',
        text: 'This is the first post of my blog',
        comments_counter: 3,
        likes_counter: 5
      )
  end

  context 'GET #index for a user post' do
    before(:each) { get user_posts_path(@user) }
    it 'is successful' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders index template' do
      expect(response).to render_template('index')
    end
  end

  context 'GET #show' do
    before(:each) { get user_post_path(@user, @post) }
    it 'is successful' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders show template' do
      expect(response).to render_template('show')
    end
  end
end
