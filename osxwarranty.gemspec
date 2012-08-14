# -*- encoding: utf-8 -*-
require File.expand_path('../lib/osxwarranty/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Anurag Mohanty"]
  gem.email         = ["anurag@columbia.edu"]
  gem.description   = %q{Uses glarizza's warranty method to check for machine's warranty}
  gem.summary       = %q{This gem brings together glarizza's ruby script for parsing warranty info from Apple and chilcote's ASD check.}
  gem.homepage      = "https://github.com/tevren/osxwarranty"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "osxwarranty"
  gem.require_paths = ["lib"]
  gem.version       = OSXwarranty::VERSION
  gem.add_dependency "httpclient"
end
