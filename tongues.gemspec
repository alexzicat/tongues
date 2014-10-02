# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tongues/version'

Gem::Specification.new do |spec|
  spec.name          = 'tongues'
  spec.version       = Tongues::VERSION
  spec.authors       = ['Alexandre Zicat']
  spec.email         = ['dev.alexzicat@gmail.com']
  spec.description   = %q{Small language detection gem using detectlanguage.com api. Heavily inspired by the wtf_lang gem}
  spec.summary       = %q{Small language detection gem}
  spec.homepage      = 'https://github.com/alexzicat'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake', '~> 0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'webmock'
  # ruby 1.8
  #spec.add_development_dependency 'ruby-debug'
  # ruby 1.9/2.0
  #spec.add_development_dependency 'debugger'
  # ruby 2.0/2.1
  #spec.add_development_dependency 'byebug'

  spec.add_runtime_dependency 'json', '>= 0'
end
