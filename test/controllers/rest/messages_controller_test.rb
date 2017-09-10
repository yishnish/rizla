require 'test_helper'

class Rest::MessagesControllerTest < ActionController::TestCase
  test 'should create a message' do
    post :create, time: Time.zone.now, user: 'aphostle', message: 'yungler'
    assert_response :success
    message = Message.find_by(user: 'aphostle')
    
    assert_equal message.message, 'yungler'
  end
end
