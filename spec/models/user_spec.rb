require 'rails_helper'

describe 'My behaviour' do
  before :each do
    @user = User.create(password: 'abc123')
  end

  it 'has a password' do
    expect(@user.password).to eq('abc123')
    expect(@user.password_digest).to_not be_nil
  end

  it 'has messages' do
    expect(@user.messages).to be_empty
    @user.messages << Message.new(message: 'hello')
    @user.save
    @user.reload
    expect(@user.messages.map(&:message)).to include('hello')
  end

  it 'has a hashed_id' do
    @user.reload
    expect(@user.hashed_id).to_not be_nil
  end
end