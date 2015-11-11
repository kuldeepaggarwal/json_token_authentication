# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'json_token_authentication/version'

Gem::Specification.new do |spec|
  spec.name          = "json_token_authentication"
  spec.version       = JsonTokenAuthentication::VERSION
  spec.authors       = ["Kuldeep Aggarwal"]
  spec.email         = ["kd.engineer@yahoo.co.in"]

  spec.summary       = %q{Write a short summary, because Rubygems requires one.}
  spec.description   = %q{Write a longer description or delete this line}
  spec.homepage      = "https://github.com/kuldeepaggarwal/json_token_authentication"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"

  spec.add_dependency 'jwt'
  spec.add_dependency 'activesupport', '>= 3', '<= 5'
end
