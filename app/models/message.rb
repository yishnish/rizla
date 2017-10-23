class Message < ActiveRecord::Base
  include HasHashedId

  belongs_to :user
end
