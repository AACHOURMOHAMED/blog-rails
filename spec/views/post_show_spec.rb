# require 'rails_helper'

# RSpec.describe 'Post show', type: :feature do
#   before(:each) do
#     @user1 = User.create(
#       name: 'Mohamed',
#       bio: 'I am a front end developer',
#       photo: 'http://www.example.com/photo.jpg',
#       posts_counter: 0
#     )
#     @user2 = User.create(
#       name: 'John',
#       bio: 'I am a motivational writer',
#       photo: 'http://www.example.com/photo2.jpg',
#       posts_counter: 4
#     )
#     @post = Post.create(
#       user: @user1,
#       title: 'My first post',
#       text: 'This is my first post',
#       comments_counter: 0,
#       likes_counter: 0
#     )
#     Comment.create(post_id: @post.id, user_id: @user1.id, text: 'I really like this post. Good job!')
#     Comment.create(post_id: @post.id, user_id: @user1.id, text: 'I like motivational books!')
#     Comment.create(post_id: @post.id, user_id: @user2.id, text: 'Nice post. Keep it up!')
#     Comment.create(post_id: @post.id, user_id: @user2.id, text: 'I enjoyed reading your post very much!')
#     Like.create(post_id: @post.id, user_id: @user1.id)
#     Like.create(post_id: @post.id, user_id: @user2.id)
#   end
#   describe 'GET /posts/:id' do
#     it 'displays the author name' do
#       visit user_post_path(@user1, @post)
#       expect(page).to have_content(@user1.name)
#     end
#     it 'displays the post title' do
#       visit user_post_path(@user1, @post)
#       expect(page).to have_content(@post.title)
#     end
#     it 'displays the post text' do
#       visit user_post_path(@user1, @post)
#       expect(page).to have_content(@post.text)
#     end
#     it 'displays number of comments' do
#       visit user_post_path(@user1, @post)
#       expect(page).to have_content('Comments: 4')
#     end
#     it 'displays number of likes' do
#       visit user_post_path(@user1, @post)
#       expect(page).to have_content('Likes: 2')
#     end
#     it 'displays the name of the author of each comment' do
#       visit user_post_path(@user1, @post)
#       expect(page).to have_content(@user1.name)
#       expect(page).to have_content(@user2.name)
#     end
#     it 'displays the text of each comment' do
#       visit user_post_path(@user1, @post)
#       expect(page).to have_content('I really like this post. Good job!')
#       expect(page).to have_content('I like motivational books!')
#       expect(page).to have_content('Nice post. Keep it up!')
#       expect(page).to have_content('I enjoyed reading your post very much!')
#     end
#   end
# end
