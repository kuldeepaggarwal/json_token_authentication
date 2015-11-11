module JsonTokenAuthentication
  class Responder
    include JsonTokenAuthentication::Utility
    attr_reader :entity

    def initialize(entity)
      @entity = entity
    end

    def invalid_token
      { :message => 'Invalid Username/Password' }
    end

    def entity_token
      entity.present? ? valid_token : invalid_token
    end

    def valid_token
      {
        'token' => generate_valid_tokens,
        JsonTokenAuthentication.entity_identifier_method_name => entity_identifier
      }
    end

    private
      def generate_valid_tokens
        JsonTokenAuthentication.encoder.encode(entity_data, JsonTokenAuthentication.encoder_secret)
      end

      def entity_data
        {
          entity.id.to_s => entity_identifier,
          'exp' => JsonTokenAuthentication.max_expiry_time
        }
      end
  end
end
