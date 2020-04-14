# -*- encoding: utf-8 -*-
# stub: neat 1.7.4 ruby lib

Gem::Specification.new do |s|
  s.name = "neat".freeze
  s.version = "1.7.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Joel Oliveira".freeze, "Kyle Fiedler".freeze, "Reda Lemeden".freeze]
  s.date = "2016-03-04"
  s.description = "Neat is a fluid grid framework built with Bourbon with the aim of being easy\nenough to use out of the box and flexible enough to customize down the road.\n".freeze
  s.email = "design+bourbon@thoughtbot.com".freeze
  s.executables = ["neat".freeze]
  s.files = ["bin/neat".freeze]
  s.homepage = "http://neat.bourbon.io".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.1.2".freeze
  s.summary = "A lightweight, semantic grid framework built with Bourbon".freeze

  s.installed_by_version = "3.1.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<sass>.freeze, [">= 3.3"])
    s.add_runtime_dependency(%q<bourbon>.freeze, [">= 4.0"])
    s.add_development_dependency(%q<scss_lint>.freeze, ["~> 0.43"])
    s.add_development_dependency(%q<aruba>.freeze, ["~> 0.5.0"])
    s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_development_dependency(%q<css_parser>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<rb-fsevent>.freeze, ["~> 0.9.1"])
    s.add_development_dependency(%q<rdoc>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
  else
    s.add_dependency(%q<sass>.freeze, [">= 3.3"])
    s.add_dependency(%q<bourbon>.freeze, [">= 4.0"])
    s.add_dependency(%q<scss_lint>.freeze, ["~> 0.43"])
    s.add_dependency(%q<aruba>.freeze, ["~> 0.5.0"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<css_parser>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rb-fsevent>.freeze, ["~> 0.9.1"])
    s.add_dependency(%q<rdoc>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
  end
end
