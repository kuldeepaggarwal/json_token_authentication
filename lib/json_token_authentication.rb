require 'json_token_authentication/version'

module JsonTokenAuthentication
  class << self
    attr_accessor :entity_class_name, :entity_identifier_method_name,
                  :expiry_within, :encoder, :encoder_secret

    def max_expiry_time
      expiry_within.from_now.to_i
    end

    def configure
      yield(self)
    end

    def encoder
      @encoder ||= begin
        require 'jwt'
        JWT
      end
    end
  end
  self.entity_class_name = 'User'
  self.entity_identifier_method_name = 'email'
  self.expiry_within = 24.hours
  self.encoder_secret = 'secret'
end

require 'json_token_authentication/utility'
require 'json_token_authentication/responder'
require 'json_token_authentication/validator'
