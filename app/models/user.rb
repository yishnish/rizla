class User < ActiveRecord::Base
  include HasHashedId

  has_secure_password
  has_many :messages
end
