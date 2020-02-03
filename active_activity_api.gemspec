# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'active_activity_api/version'

Gem::Specification.new do |s|
  s.name          = 'active_activity_api'
  s.version       = ActiveActivityApi::VERSION
  s.authors       = ['dbwinger']
  s.email         = ['daryl@entrision.com']
  s.homepage      = 'https://github.com/dbwinger/active_activity_api'
  s.licenses      = ['MIT']
  s.summary       = 'Ruby wrapper for Active.com activity search v2 API'
  s.description   = ''

  s.files         = Dir.glob('{bin/*,lib/**/*,[A-Z]*}')
  s.platform      = Gem::Platform::RUBY
  s.require_paths = ['lib']

  s.add_development_dependency 'byebug'
  s.add_development_dependency 'dotenv'

  s.add_dependency 'httparty'
end
