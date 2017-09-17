require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  test 'creating a message' do
    time = Time.zone.now
    user = 'bobbay!'
    message = 'this game is dying!'
    host = 'aphostle'
    new_message = Message.new(time: time, user: user, message: message, host: host)
    
    new_message.save!
    
    assert_equal(time, new_message.time)
    assert_equal(message, new_message.message)
    assert_equal(user, new_message.user)
    assert_equal(host, new_message.host)
  end
end
