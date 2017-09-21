class MessageResource < JSONAPI::Resource
  attributes :host, :user, :time, :message
end