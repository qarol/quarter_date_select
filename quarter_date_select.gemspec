# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'quarter_date_select/version'

Gem::Specification.new do |spec|
  spec.name          = "quarter_date_select"
  spec.version       = QuarterDateSelect::VERSION
  spec.authors       = ["Karol Bajko"]
  spec.email         = ["karol.bajko@gmail.com"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  end

  spec.summary       = %q{Simple date helper to create a quarter of year select tag.}
  spec.description   = ""
  spec.homepage      = "https://github.com/qarol/quarter_date_select"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
