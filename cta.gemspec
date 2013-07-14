# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cta/version'

Gem::Specification.new do |spec|
  spec.name          = "cta"
  spec.version       = Cta::VERSION
  spec.authors       = ["Andrew Allen"]
  spec.email         = ["andrewallen2012@gmail.com"]
  spec.description   = ""
  spec.summary       = ""
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "fakeweb"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "awesome_print"

  spec.add_runtime_dependency "httparty"
end
