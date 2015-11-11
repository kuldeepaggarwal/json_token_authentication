module JsonTokenAuthentication
  class Validator
    include JsonTokenAuthentication::Utility

    def initialize(token)
      @decoded_data = (JsonTokenAuthentication.encoder.decode(token, nil, false).first rescue {})
    end

    def valid_token?
      decoded_data.present? &&
      entity_identifier == token_identifier
    end

    def entity
      if decoded_data.present?
        @entity ||= JsonTokenAuthentication.entity_class_name.constantize.find_by(id: entity_id)
      end
    end

    private
      attr_reader :decoded_data

      def entity_id
        @entity_id ||= decoded_data.each_key.first
      end

      def token_identifier
        decoded_data[entity_id.to_s]
      end

      def entity_identifier
        entity && entity.public_send(JsonTokenAuthentication.entity_identifier_method_name)
      end
  end
end
