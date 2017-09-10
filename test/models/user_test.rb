require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "has a password" do
    user = User.new(password: 'abc123')
    user.save!
    assert_equal user.password, 'abc123'
    assert_not_nil user.password_digest
  end
end
