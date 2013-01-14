# encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'distribute/version'

Gem::Specification.new do |gem|
  gem.name          = "distribute"
  gem.version       = Distribute::VERSION
  gem.authors       = ["Kurtis Rainbolt-Greene"]
  gem.email         = ["me@kurtisrainboltgreene.name"]
  gem.summary       = %q{A small distribution method for binaries or libraries.}
  gem.description   = gem.summary
  gem.homepage      = "http://krainboltgreene.github.com/distribute"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'yard'
  gem.add_development_dependency 'kramdown'
  # gem.add_runtime_dependency 'gemname', '~> 1.0'
  # gem.add_development_dependency 'gemname', '~> 1.0'
end
