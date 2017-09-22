require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

  it 'should something' do
    headers = {
        'Accept' => 'application/vnd.api+json',
        'Content-Type' => 'application/vnd.api+json'
    }
    request.headers.merge! headers
    post :create, data: {type: 'messages', attributes: { host: 'a host', user: 'a user', message: 'a message', time: '12:04' }}
    expect(response.status).to eq(201)
  end
end
