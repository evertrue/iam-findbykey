# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'iam/findbykey/version'

Gem::Specification.new do |spec|
  spec.name          = "iam-findbykey"
  spec.version       = Iam::Findbykey::VERSION
  spec.authors       = ["Eric Herot"]
  spec.email         = ["eric.herot@evertrue.com"]
  spec.summary       = %q{Find IAM Users by Key}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'fog', '~> 1.23'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
