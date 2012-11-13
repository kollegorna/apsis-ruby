# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'apsis/version'

Gem::Specification.new do |gem|
  gem.name          = "apsis"
  gem.version       = Apsis::VERSION
  gem.authors       = ["Henrik Sjökvist"]
  gem.email         = ["henrik.sjokvist@gmail.com"]
  gem.description   = %q{A simple API wrapper for the APSIS mail marketing service.}
  gem.summary       = %q{A simple API wrapper for the APSIS mail marketing service.}
  gem.homepage      = "http://github.com/kollegorna/apsis-ruby"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.rubyforge_project = "apsis"

  # Dependencies
  # specify any dependencies here; for example:
  gem.add_development_dependency "rspec"
  gem.add_runtime_dependency     "faraday"
end
