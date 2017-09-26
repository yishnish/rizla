require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  before do
    @token = Doorkeeper::AccessToken.create.token
    set_jsonapi_headers
  end

  it 'should create messages' do
    message = 'a message'
    post :create, access_token: @token, data: {type: 'messages', attributes: {host: 'a host', user: 'a user', message: message, time: '12:04' }}
    expect(response.status).to eq(201)
    expect(Message.all.where(message: message).length).to eq(1)
  end

  it 'should get messages' do
    Message.create(user: 'a user', message: 'a message')
    get :index, access_token: @token

    expect(JSON.parse(response.body)['data'][0]['attributes']['message']).to eq('a message')
  end

  describe 'authorization' do
    it 'should require an authorization token' do
      get :index
      expect(response.status).to eq(401)
    end
  end

  private
  def set_jsonapi_headers
    headers = {
        'Accept' => 'application/vnd.api+json',
        'Content-Type' => 'application/vnd.api+json'
    }
    request.headers.merge! headers
  end
end
