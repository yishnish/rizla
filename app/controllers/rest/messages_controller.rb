class Rest::MessagesController < ApplicationController
  
  before_filter :set_up_cors
  
  skip_before_filter :verify_authenticity_token, only: :create
  
  def create
    puts message_params
    
    message = Message.new(message_params)
    if(message.save)
      render status: 200, json: {}.to_json
    end
  end
  
private
  
  def message_params
    params.permit(:time, :user, :message)
  end
  
  def set_up_cors
    headers['Access-Control-Allow-Origin'] = '*'
  end
end
