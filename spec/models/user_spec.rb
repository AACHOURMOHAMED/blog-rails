require 'rails_helper'

describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 3) }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should be present' do
    subject.name = 'Tom'
    expect(subject).to be_valid
  end

  it 'posts_counter should be an integer' do
    subject.posts_counter = 'three'
    expect(subject).to_not be_valid
  end

  it 'posts_counter should be an integer' do
    subject.posts_counter = 3
    expect(subject).to be_valid
  end

  it 'posts_counter should not be negative' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'bio should be less than 180 characters' do
    subject.bio = 'a' * 181
    expect(subject).to_not be_valid
  end

  it 'bio should be less than 180 characters' do
    subject.bio = 'a' * 180
    expect(subject).to be_valid
  end

  it 'bio should be more than 20 characters' do
    subject.bio = 'a' * 19
    expect(subject).to_not be_valid
  end

  it 'bio should be more than 20 characters' do
    subject.bio = 'a' * 20
    expect(subject).to be_valid
  end
end
