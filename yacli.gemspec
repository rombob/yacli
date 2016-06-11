# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yacli/version'

Gem::Specification.new do |spec|
  spec.name          = "yacli"
  spec.version       = Yacli::VERSION
  spec.authors       = ["rombob"]
  spec.email         = ["rombob@gmail.com"]
  spec.summary       = "CLI wrapper library tool"
  spec.description   = "Provide minimal tools for shell commands wrapper scripts"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "thor", "0.19.1"
  
  spec.add_development_dependency "rspec_junit_formatter", '0.2.3'
  spec.add_development_dependency "simplecov", "0.10.0"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rubocop", "0.40.0"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "bump"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "growl"
  spec.add_development_dependency "guard", "2.13.0"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "coveralls"
end
