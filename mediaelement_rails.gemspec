# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "mediaelement_rails/version"

Gem::Specification.new do |s|
  s.name        = "mediaelement_rails"
  s.version     = MediaelementRails::VERSION
  s.authors     = ["Mark Oleson", "Tobias Schlottke", "Pete Browne"]
  s.email       = ["fusion2004@gmail.com", "tobias.schlottke@gmail.com", "me@petebrowne.com"]
  s.homepage    = "https://github.com/tobsch/mediaelement_rails"
  s.summary     = %q{MediaElement.js for Rails}
  s.description = %q{A MediaElement gem(engine) for Rails. Makes embedding HTML5 video easy.}
  s.license     = "MIT"

  s.add_dependency "railties",     ">= 3.1"
  s.add_dependency "jquery-rails", ">= 1.0"

  s.add_development_dependency "rails", ">= 3.1"
  s.add_development_dependency "i18n"
  s.add_development_dependency "turn"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "thor"
  s.add_development_dependency "rake"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
