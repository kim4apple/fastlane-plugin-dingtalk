# coding: utf-8

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/dingtalk/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-dingtalk'
  spec.version       = Fastlane::Dingtalk::VERSION
  spec.author        = 'Kim Huang'
  spec.email         = 'kim4apple@gmail.com'

  spec.summary       = 'a fastlane plugin for dingtalk robot'
  spec.homepage      = "https://github.com/kim4apple/fastlane-plugin-dingtalk"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  # Don't add a dependency to fastlane or fastlane_re
  # since this would cause a circular dependency

  spec.add_dependency 'dingbot', '~> 0.2.2'

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'fastlane', '>= 2.61.0'
end
