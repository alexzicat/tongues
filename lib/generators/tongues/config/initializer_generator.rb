require 'rails/generators'

module Tongues
  class InitializerGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    desc 'This generator creates an initializer for the api key.'
    def add_initializer
      template 'initializer.rb', 'config/initializers/tongues.rb'
    end
  end
end