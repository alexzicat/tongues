# Tongues

Language detection gem using detectlanguage.com api.
Returns the language of a string or a symbol.

## Installation

Add this line to your application's Gemfile:

    gem 'tongues'

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install tongues

## Usage

The gem installed, you need to generate the initializer file:

    rails generate tongues:initializer

Add your detectlanguage.com api key inside config/initializers/tongues.rb:

    Tongues.configure do |config|
      require 'tongues'
      config.api_key = ''
    end

You are now ready to use the gem

    "how you get a String language".tongue # => "ENGLISH"
    "how you get a String language code".tongue_code # => "en"
    "how you get the confidence in a language detection".tongue_confidence # => 15.09

    "is this english".en? # => true
    "is this english".english? # => true

    :"how you get a Symbol language".tongue # => "ENGLISH"
    :"how you get a Symbol language code".tongue_code # => "en"
    :"how you get the confidence in a language detection".tongue_confidence # => 15.09

    :"is this english".en? # => true
    :"is this english".english? # => true

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
