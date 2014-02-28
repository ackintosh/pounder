# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pounder/version'

Gem::Specification.new do |spec|
  spec.name          = "sixpounder"
  spec.version       = Pounder::VERSION
  spec.authors       = ["Akihito Nakano"]
  spec.email         = ["sora.akatsuki@gmail.com"]
  spec.description   = %q{POP server}
  spec.summary       = %q{POP server for operation verification}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "ackintosh-net-empty_port"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
