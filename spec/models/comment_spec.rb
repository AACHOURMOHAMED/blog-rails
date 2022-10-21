require_relative '../rails_helper'

RSpec.describe Comment, type: :model do
  subject { Comment.new(text: 'This is a comment', LikesCounter: 4) }

  before { subject.save }

  it 'text should be present' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'text should be present' do
    subject.text = 'This is a comment'
    expect(subject).to be_valid
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
