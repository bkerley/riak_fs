# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "riakfs/version"

Gem::Specification.new do |s|
  s.name        = "riakfs"
  s.version     = Riakfs::VERSION
  s.authors     = ["Bryce Kerley"]
  s.email       = ["bkerley@brycekerley.net"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "riakfs"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
  s.add_development_dependency 'minitest', '~> 2.11'
  s.add_development_dependency 'mocha', '~> 0.10'
  s.add_development_dependency 'rake', '~> 0.9.2'
end
