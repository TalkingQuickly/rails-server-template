# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "cli/version"

Gem::Specification.new do |s|
  s.name        = "cli"
  s.version     = Cli::VERSION
  s.authors     = ["Ben Dixon"]
  s.email       = ["ben@talkingquickly.co.uk"]
  s.homepage    = ""
  s.summary     = %q{Simple CLI for creating servers as per Reliably Deploying Rails applications}
  s.description = %q{same as summary}

  s.rubyforge_project = "cli"

  s.files         = `git ls-files`.split("\n")
  #s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables << 'cli'
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  #s.add_development_dependency "rr"
  #s.add_development_dependency "fakefs"
  #s.add_development_dependency "guard-minitest"
  #s.add_development_dependency "rake"
  s.add_runtime_dependency "user_config"
  s.add_runtime_dependency "thor"
end
