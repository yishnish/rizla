require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

  it 'should create messages' do
    headers = {
        'Accept' => 'application/vnd.api+json',
        'Content-Type' => 'application/vnd.api+json'
    }
    request.headers.merge! headers
    message = 'a message'
    post :create, data: {type: 'messages', attributes: {host: 'a host', user: 'a user', message: message, time: '12:04' }}
    expect(response.status).to eq(201)
    expect(Message.all.where(message: message).length).to eq(1)
  end
end
