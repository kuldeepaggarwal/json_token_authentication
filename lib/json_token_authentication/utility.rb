module JsonTokenAuthentication
  module Utility
    def entity_identifier
      entity.public_send(JsonTokenAuthentication.entity_identifier_method_name).to_s
    end
  end
end
