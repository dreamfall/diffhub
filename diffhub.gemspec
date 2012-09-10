# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'diffhub/version'

Gem::Specification.new do |gem|
  gem.name          = "diffhub"
  gem.version       = Diffhub::VERSION
  gem.authors       = ["Vasili Kachalko"]
  gem.email         = ["amarant.st@gmail.com"]
  gem.description   = %q{Uploads the output of "git diff" comand to a gist}
  gem.summary       = %q{Fast and easy diff upload to github's gist}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'github_api'
end
