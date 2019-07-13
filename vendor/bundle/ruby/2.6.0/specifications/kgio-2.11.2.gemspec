# -*- encoding: utf-8 -*-
# stub: kgio 2.11.2 ruby lib
# stub: ext/kgio/extconf.rb

Gem::Specification.new do |s|
  s.name = "kgio".freeze
  s.version = "2.11.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["kgio hackers".freeze]
  s.date = "2018-01-30"
  s.description = "This is a legacy project, do not use it for new projects.  Ruby\n2.3 and later should make this obsolete.  kgio provides\nnon-blocking I/O methods for Ruby without raising exceptions on\nEAGAIN and EINPROGRESS.".freeze
  s.email = "kgio-public@bogomips.org".freeze
  s.extensions = ["ext/kgio/extconf.rb".freeze]
  s.extra_rdoc_files = ["LICENSE".freeze, "README".freeze, "TODO".freeze, "NEWS".freeze, "LATEST".freeze, "ISSUES".freeze, "HACKING".freeze, "lib/kgio.rb".freeze, "ext/kgio/accept.c".freeze, "ext/kgio/autopush.c".freeze, "ext/kgio/connect.c".freeze, "ext/kgio/kgio_ext.c".freeze, "ext/kgio/poll.c".freeze, "ext/kgio/wait.c".freeze, "ext/kgio/tryopen.c".freeze]
  s.files = ["HACKING".freeze, "ISSUES".freeze, "LATEST".freeze, "LICENSE".freeze, "NEWS".freeze, "README".freeze, "TODO".freeze, "ext/kgio/accept.c".freeze, "ext/kgio/autopush.c".freeze, "ext/kgio/connect.c".freeze, "ext/kgio/extconf.rb".freeze, "ext/kgio/kgio_ext.c".freeze, "ext/kgio/poll.c".freeze, "ext/kgio/tryopen.c".freeze, "ext/kgio/wait.c".freeze, "lib/kgio.rb".freeze]
  s.homepage = "https://bogomips.org/kgio/".freeze
  s.licenses = ["LGPL-2.1+".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "kinder, gentler I/O for Ruby".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<olddoc>.freeze, ["~> 1.0"])
      s.add_development_dependency(%q<test-unit>.freeze, ["~> 3.0"])
    else
      s.add_dependency(%q<olddoc>.freeze, ["~> 1.0"])
      s.add_dependency(%q<test-unit>.freeze, ["~> 3.0"])
    end
  else
    s.add_dependency(%q<olddoc>.freeze, ["~> 1.0"])
    s.add_dependency(%q<test-unit>.freeze, ["~> 3.0"])
  end
end
