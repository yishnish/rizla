require 'rails_helper'

describe 'My behaviour' do
  it 'has a password' do
    user = User.new(password: 'abc123')
    user.save!
    expect(user.password).to eq('abc123')
    expect(user.password_digest).to_not be_nil
  end
end