require 'rails/generators'

module Tongues
  class TonguesGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    desc 'This generator creates an initializer for the api key.'
    def copy_initializer_file
      copy_file 'initializer.rb', 'config/initializers/tongues.rb'
    end
  end
end