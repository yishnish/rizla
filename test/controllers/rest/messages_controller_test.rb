require 'test_helper'

class Rest::MessagesControllerTest < ActionController::TestCase
  test 'should create a message' do
    post :create, time: Time.zone.now, user: 'aphostle', message: 'yoongler', username: User.first.name, password: User.first.password
    assert_response :success
    message = Message.find_by(user: 'aphostle')
    
    assert_equal message.message, 'yoongler'
  end
  
  test 'it fails without correct password' do
    post :create, time: Time.zone.now, user: 'whatever', message: 'yarrrr'
    assert_response 401
  end
end
