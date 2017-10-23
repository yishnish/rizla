module HashedIdResource
  def self.included(base)
    base.send(:key_type, :string)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def find_by_key(key, options = {})
      context = options[:context]
      records = records(options)
      records = apply_includes(records, options)
      model = records.find_by(hashed_id: key)
      fail JSONAPI::Exceptions::RecordNotFound, key if model.nil?
      resource_for_model(model).new(model, context)
    end
  end
end