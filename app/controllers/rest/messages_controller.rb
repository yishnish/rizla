class Rest::MessagesController < ApplicationController  
  before_filter :set_up_cors
  before_filter :authenticate
  
  skip_before_filter :verify_authenticity_token, only: :create
  
  def create
    if authenticate
      message = Message.new(message_params)
      if(message.save)
        render status: 200, json: {}.to_json
      end
    else
      render status: 401, json: {}.to_json
    end
  end
  
private
  
  def message_params
    params.permit(:time, :user, :message)
  end
  
  def authenticate
    user = User.find_by(name: params[:username])
    return user && user.authenticate(params[:password])
  end
  
  def set_up_cors
    headers['Access-Control-Allow-Origin'] = '*'
  end
end
