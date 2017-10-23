class MessageResource < JSONAPI::Resource
  include HashedIdResource

  attributes :host, :user_name, :time, :message
  has_one :user

  def id
    @model.hashed_id
  end
end