require 'rails_helper'

RSpec.describe 'Post index', type: :feature do
  before(:each) do
    @user1 = User.create(
      name: 'Mohamed',
      bio: 'I am a front end developer',
      photo: 'http://www.example.com/photo.jpg',
      posts_counter: 0
    )
    @post = Post.create(
      user: @user1,
      title: 'My first post',
      text: 'This is my first post',
      comments_counter: 0,
      likes_counter: 0
    )
    @post2 = Post.create(
      user: @user1,
      title: 'My second post',
      text: 'This is my second post',
      comments_counter: 0,
      likes_counter: 0
    )
    Comment.create(post_id: @post.id, user_id: @user1.id, text: 'I really like this post. Good job!')
    Comment.create(post_id: @post2.id, user_id: @user1.id, text: 'I enjoyed reading your post very much!')
    Like.create(post_id: @post.id, user_id: @user1.id)
    Like.create(post_id: @post2.id, user_id: @user1.id)
  end
  describe 'GET /posts' do
    it 'displays the user name' do
      visit user_posts_path(@user1)
      expect(page).to have_content(@user1.name)
    end
    it 'displays the post title' do
      visit user_posts_path(@user1)
      expect(page).to have_content(@post.title)
    end
    it 'displays the post text' do
      visit user_posts_path(@user1)
      expect(page).to have_content(@post.text)
    end
    it 'displays the user photo' do
      visit user_posts_path(@user1)
      expect(page).to have_css("img[src='http://www.example.com/photo.jpg']")
    end
    it 'displays the number of comments' do
      visit user_posts_path(@user1)
      expect(page).to have_content('2')
    end
    it 'displays the number of likes' do
      visit user_posts_path(@user1)
      expect(page).to have_content('2')
    end
    it 'displays the number of posts' do
      visit user_posts_path(@user1)
      expect(page).to have_content('Number of posts: 2')
    end
    it 'redirect to the post show page when clicking on the post title' do
      visit user_posts_path(@user1)
      click_link(@post.title)
      expect(page).to have_current_path(user_post_path(@user1, @post))
    end
    it 'displays first comment text' do
      visit user_posts_path(@user1)
      expect(page).to have_content('I really like this post. Good job!')
    end
  end
end
