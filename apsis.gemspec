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
  gem.summary       = %q{A simple API wrapper for the APSIS mail marketing service. 
                         This gem currently only supports adding subcribers to a mailing list.}
  gem.homepage      = "http://github.com/kollegorna/apsis-ruby"
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.rubyforge_project = "apsis"

  # Dependencies
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "vcr"
  gem.add_runtime_dependency     "faraday"
end
