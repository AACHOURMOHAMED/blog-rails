require_relative '../rails_helper'

RSpec.describe Comment, type: :model do
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
      user: user,
      title: 'My first post',
      text: 'This is my first post',
      comments_counter: 1,
      likes_counter: 2
    )
  end

  let(:comment) do
    Comment.new(
      user: user,
      post: post,
      text: 'Hey!, it is my first comment'
    )
  end

  it 'is not valid without a text' do
    comment.text = 'Hey!, it is my first comment'
    expect(comment).to be_valid
  end

  it 'is not valid without a text' do
    comment.text = nil
    expect(comment).to_not be_valid
  end

  it 'is only valid with a user' do
    comment.user = user
    expect(comment).to be_valid
  end

  it 'is only valid wiht a user' do
    comment.user = nil
    expect(comment).to_not be_valid
  end

  it 'it only valid with a post' do
    comment.post = nil
    expect(comment).to_not be_valid
  end

  it 'is valid with a post' do
    comment.post = post
    expect(comment).to be_valid
  end
end
