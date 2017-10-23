require 'securerandom'

module HasHashedId
  HASHED_ID_LENGTH = 12
  extend ActiveSupport::Concern

  included do
    before_save :set_hashed_id
  end

  def set_hashed_id
    self.hashed_id ||= SecureRandom.base64(12)[0...12]
  end
end