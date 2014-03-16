module Tongues
  module Detection
    require 'tongues/api_connexion'
    require 'tongues/config/configuration'

    ## Returns the full language name
    def tongue
      detect_tongue && detect_tongue.language
    end

    ## Returns the language code
    def tongue_code
      detect_tongue && detect_tongue.lang_symbol
    end

    ## Returns the confidence in language
    def tongue_confidence
      detect_tongue && detect_tongue.confidence
    end

    ## Comparison to languages
    Tongues::Configuration.languages.each do |lang_symbol, language|
      self.class_eval <<-RUBY, __FILE__, __LINE__ + 1
        def #{lang_symbol}?
          language && language == "#{lang_symbol}"
        end

        def #{language}?
          full_language && full_language == "#{language}"
        end
      RUBY
    end

    private

    ## Calls the api and returns the language
    def detect_tongue
      @tongue ||= Tongues::ApiConnexion.detect self.to_s
    end
  end
end