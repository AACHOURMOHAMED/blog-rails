require 'rails_helper'

describe User, type: :model do
  subject { User.new(name: 'Tom', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.', PostCounter: 3) }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should be present' do
    subject.name = 'Tom'
    expect(subject).to be_valid
  end

  it 'PostCounter should be an integer' do
    subject.PostCounter = 'three'
    expect(subject).to_not be_valid
  end

  it 'PostCounter should be an integer' do
    subject.PostCounter = 3
    expect(subject).to be_valid
  end

  it 'PostCounter should not be negative' do
    subject.PostCounter = -1
    expect(subject).to_not be_valid
  end

  it 'bio should be less than 180 characters' do
    subject.Bio = 'a' * 181
    expect(subject).to_not be_valid
  end

  it 'Bio should be less than 180 characters' do
    subject.Bio = 'a' * 180
    expect(subject).to be_valid
  end

  it 'Bio should be more than 20 characters' do
    subject.Bio = 'a' * 19
    expect(subject).to_not be_valid
  end

  it 'Bio should be more than 20 characters' do
    subject.Bio = 'a' * 20
    expect(subject).to be_valid
  end
end
