# -*- encoding: utf-8 -*-
require File.expand_path('../lib/osxwarranty/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Anurag Mohanty"]
  gem.email         = ["anurag@columbia.edu"]
  gem.description   = %q{retrieves warranty info for macs based on serial number, uses glarizza's warranty script and chilcote's asdcheck script}
  gem.summary       = %q{retrieves warranty info for macs based on serial number}
  gem.homepage      = "https://github.com/tevren/osxwarranty"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "osxwarranty"
  gem.require_paths = ["lib"]
  gem.version       = OSXwarranty::VERSION
  gem.add_dependency "httpclient"
  gem.add_dependency "nokogiri"
  gem.add_development_dependency "rspec"
end
