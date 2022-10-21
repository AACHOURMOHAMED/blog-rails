require 'rails_helper'

describe Post, type: :model do
  subject { Post.new(title: 'My first post', text: 'This is my first post', CommentsCounter: 3, LikesCounter: 4) }

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should be present' do
    subject.title = 'My first post'
    expect(subject).to be_valid
  end

  it 'text should be present' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'text should be present' do
    subject.text = 'This is my first post'
    expect(subject).to be_valid
  end

  it 'CommentsCounter should be an integer' do
    subject.CommentsCounter = 'three'
    expect(subject).to_not be_valid
  end

  it 'CommentsCounter should be an integer' do
    subject.CommentsCounter = 3
    expect(subject).to be_valid
  end

  it 'CommentsCounter should not be negative' do
    subject.CommentsCounter = -1
    expect(subject).to_not be_valid
  end

  it 'LikesCounter should be an integer' do
    subject.LikesCounter = 'four'
    expect(subject).to_not be_valid
  end

  it 'LikesCounter should be an integer' do
    subject.LikesCounter = 4
    expect(subject).to be_valid
  end

  it 'LikesCounter should not be negative' do
    subject.LikesCounter = -1
    expect(subject).to_not be_valid
  end
end
