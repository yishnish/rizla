class UserResource < JSONAPI::Resource
  include HashedIdResource

  attributes :name, :created_at, :updated_at
  has_many :messages


  def id
    @model.hashed_id
  end
end