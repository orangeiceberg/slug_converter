# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'slug_converter/version'

Gem::Specification.new do |spec|
  spec.name          = "slug_converter"
  spec.version       = SlugConverter::VERSION
  spec.authors       = ["Jovana Dacic"]
  spec.email         = ["jovanadacic@gmail.com"]

  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  # end

  spec.summary       = %q{Number <-> Slug converter}
  spec.description   = %q{Generates a slug based on the given number and the other way around}
  spec.homepage      = "https://github.com/orangeiceberg/slug_converter"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec'

  spec.add_runtime_dependency 'gem_config'
end
