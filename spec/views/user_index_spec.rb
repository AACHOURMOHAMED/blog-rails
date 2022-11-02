require 'rails_helper'

RSpec.describe 'User index', type: :feature do
  before(:each) do
    @user = User.create(
      name: 'John',
      bio: 'I am a photographer. I really like taking pictures of people.',
      photo: 'http://www.example.com/photo.jpg',
      posts_counter: 3
    )

    @user2 = User.create(
      name: 'Jane',
      bio: 'I am a writer. I really like writing about animals.',
      photo: 'http://www.example.com/photo2.jpg',
      posts_counter: 5
    )
  end

  describe 'GET /users' do
    it 'displays the correct usernames' do
      visit users_path

      expect(page).to have_content('John')
      expect(page).to have_content('Jane')
    end

    it 'displays the correct number of posts' do
      visit users_path

      expect(page).to have_content('Number of Posts: 3')
      expect(page).to have_content('Number of Posts: 5')
    end

    it 'displays the correct photo' do
      visit users_path

      expect(page).to have_css('img[src="http://www.example.com/photo.jpg"]')
      expect(page).to have_css('img[src="http://www.example.com/photo2.jpg"]')
    end

    it 'displays the correct link to the user show page' do
      visit users_path

      expect(page).to have_link('John', href: user_path(@user))
      expect(page).to have_link('Jane', href: user_path(@user2))
    end

    it 'redirect to the user show page when the user name is clicked' do
      visit users_path

      click_link('John')

      expect(page).to have_current_path(user_path(@user))
    end
  end
end
