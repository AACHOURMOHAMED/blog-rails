require 'rails_helper'

describe Post, type: :model do
  let(:user) do
    User.new(
      name: 'John',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'I am a photographer',
      posts_counter: 4
    )
  end

  let(:post) do
    Post.new(
      users: user,
      title: 'My first post',
      text: 'This is my first post',
      comments_counter: 1,
      likes_counter: 2
    )
  end

  it 'title should be present' do
    post.title = nil
    expect(post).to_not be_valid
  end

  it 'title should be present' do
    post.title = 'My first post'
    expect(post).to be_valid
  end

  it 'title should not be too long' do
    post.title = 'a' * 251
    expect(post).to_not be_valid
  end

  it 'title should not be too long' do
    post.title = 'a' * 249
    expect(post).to be_valid
  end

  it 'comments_counter should be an integer' do
    post.comments_counter = 'two'
    expect(post).to_not be_valid
  end

  it 'comments_counter should be an integer' do
    post.comments_counter = 2
    expect(post).to be_valid
  end

  it 'comments_counter should not be negative' do
    post.comments_counter = -1
    expect(post).to_not be_valid
  end

  it 'likes_counter should be an integer' do
    post.likes_counter = 'four'
    expect(post).to_not be_valid
  end

  it 'likes_counter should be an integer' do
    post.likes_counter = 4
    expect(post).to be_valid
  end

  it 'likes_counter should not be negative' do
    post.likes_counter = -1
    expect(post).to_not be_valid
  end
end
