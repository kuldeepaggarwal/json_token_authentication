require 'rails/generators/base'

module JsonTokenAuthentication
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../../templates', __FILE__)

      desc 'Creates a JsonTokenAuthentication initializer'

      def copy_initializer
        template 'json_token_authentication.rb', 'config/initializers/json_token_authentication.rb'
      end
    end
  end
end
