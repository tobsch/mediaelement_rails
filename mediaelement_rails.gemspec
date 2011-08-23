# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "mediaelement_rails/version"

Gem::Specification.new do |s|
  s.name        = "mediaelement_rails"
  s.version     = MediaelementRails::VERSION
  s.authors     = ["Tobias Schlottke"]
  s.email       = ["tobias.schlottke@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{MediaElement.js for rails}
  s.description = %q{a MediaElement gem(engine) for rails. Makes embedding HTML5 video easy}
  
  s.add_dependency "railties",     ">= 3.1.0.rc6"
  s.add_dependency "jquery-rails", "~> 1.0"
  
  s.add_development_dependency "rake",     ">= 0.8.7"
  s.add_development_dependency "bundler",  "~> 1.0.0"
  s.add_development_dependency "rails",    ">= 3.1.0.rc6"
  s.add_development_dependency "capybara", "~> 1.0.1"
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
