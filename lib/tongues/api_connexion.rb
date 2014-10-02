require 'net/http'
require 'cgi'
require 'tongues/tongue'

module Tongues
  class ApiConnexion

    class << self

      ## Detects the language for the text in params
      def detect(text)
        if Tongues::Configuration.api_key.nil? or Tongues::Configuration.api_key.empty?
          raise NoApiKeyError, 'Invalid api key. Check config/initializers/tongues.rb'
        end

        response = call_api(text)

        if detection = parse_response(response)
          lang_symbol = detection['language']
          language = Tongues::Configuration.languages[lang_symbol]
          confidence = detection['confidence']
          Tongue.new(lang_symbol, language, confidence)
        end
      end
    end

    private

    ## Generates the URL to call
    def self.url(text)
      "#{Tongues::Configuration.api_url}?key=#{Tongues::Configuration.api_key}&q=#{parse_request(text)}"
    end

    ## Calls the API
    def self.call_api(text)
      Net::HTTP.get(URI.parse(url(text)))
    end

    ## Parses the request text
    def self.parse_request(text)
      CGI.escape(text)
    end

    ## Parses the response
    def self.parse_response(response)
      JSON.parse(response)['data']['detections'].first
    end
  end

  class NoApiKeyError < StandardError
  end
end
