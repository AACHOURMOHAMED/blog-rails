require 'rails_helper'

RSpec.describe 'User show', type: :feature do
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
      comments_counter: 2,
      likes_counter: 9
    )

    @post2 = Post.create(
      user: @user1,
      title: 'My second post',
      text: 'This is my second post',
      comments_counter: 3,
      likes_counter: 10
    )
  end

  describe 'GET /users/:id' do
    it 'displays the correct username' do
      visit user_path(@user1)

      expect(page).to have_content('Mohamed')
    end

    it 'displays the correct photo' do
      visit user_path(@user1)

      expect(page).to have_css('img[src="http://www.example.com/photo.jpg"]')
    end

    it 'displays number of posts' do
      visit user_path(@user1)

      expect(page).to have_content("Number of Posts: #{@user1.posts_counter}")
    end

    it 'displays the correct posts' do
      visit user_path(@user1)

      expect(page).to have_content('My first post')
      expect(page).to have_content('My second post')
    end

    it 'displays the bio' do
      visit user_path(@user1)

      expect(page).to have_content('I am a front end developer')
    end

    it 'displays button to see all posts' do
      visit user_path(@user1)

      expect(page).to have_link('See all posts')
    end

    it 'redirects to the posts index page when the button is clicked' do
      visit user_path(@user1)

      click_link('See all posts')

      expect(page).to have_current_path(user_posts_path(@user1))
    end

    it 'displays the correct number of comments' do
      visit user_path(@user1)

      expect(page).to have_content('Comments: 2')
    end

    it 'displays the correct number of likes' do
      visit user_path(@user1)

      expect(page).to have_content('Likes: 9')
    end

    it 'redirects to posts show page when clicking on a post' do
      visit user_path(@user1)

      click_link('My first post')

      expect(page).to have_current_path(user_post_path(@user1, @post))
    end
  end
end
