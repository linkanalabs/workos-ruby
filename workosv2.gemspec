# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'workosv2/version'

Gem::Specification.new do |spec|
  spec.name = 'workosv2'
  spec.version = WorkOSV2::VERSION
  spec.authors = ['WorkOSV2']
  spec.email = ['support@workos.com']
  spec.description = 'API client for WorkOS V2.15'
  spec.summary = 'API client for WorkOS V2.15'
  spec.homepage = 'https://github.com/workos-inc/workos-ruby'
  spec.license = 'MIT'
  spec.metadata = {
    'documentation_uri' => 'https://docs.workos.com/sdk/ruby',
  }

  spec.files = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'sorbet-runtime', '~> 0.5'

  spec.add_development_dependency 'bundler', '>= 2.0.1'
  spec.add_development_dependency 'codecov', '~> 0.2.8'
  spec.add_development_dependency 'rspec', '~> 3.9.0'
  spec.add_development_dependency 'rubocop', '~> 0.77'
  spec.add_development_dependency 'sorbet', '~> 0.5'
  spec.add_development_dependency 'tapioca'
  spec.add_development_dependency 'vcr', '~> 5.0.0'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'yard'

  spec.required_ruby_version = '>= 2.5'
end
