# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "zipster/version"

Gem::Specification.new do |s|
  s.name        = "zipster"
  s.version     = Zipster::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ethan Vizitei"]
  s.email       = ["ethan.vizitei@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Map zip codes to states}
  s.description = %q{Give zipster a zip code, it will tell you what state it belongs to}

  s.rubyforge_project = "zipster"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_development_dependency(%q<rspec>)
  s.add_runtime_dependency(%q<algorithms>)
end
