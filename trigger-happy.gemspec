# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{trigger-happy}
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Alex Gibbons"]
  s.date = %q{2011-02-02}
  s.description = %q{TriggerHappy watches a directory of files and tells browser pages, activated with a bookmarklet, to refresh when changes are detected}
  s.email = %q{alex.gibbons [a] gmail [dot] com}
  s.executables = ["trigger-happy", "trigger-happy-setup"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "bin/trigger-happy",
    "bin/trigger-happy-setup",
    "lib/trigger-happy.rb",
    "lib/trigger-happy/install_page_server.rb",
    "test/helper.rb",
    "test/test_trigger-happy.rb",
    "trigger-happy.gemspec"
  ]
  s.homepage = %q{http://github.com/alexgb/trigger-happy}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Browser page refreshing for your web projects}
  s.test_files = [
    "test/helper.rb",
    "test/test_trigger-happy.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<em-websocket>, [">= 0"])
      s.add_runtime_dependency(%q<directory_watcher>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
    else
      s.add_dependency(%q<em-websocket>, [">= 0"])
      s.add_dependency(%q<directory_watcher>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_dependency(%q<rcov>, [">= 0"])
    end
  else
    s.add_dependency(%q<em-websocket>, [">= 0"])
    s.add_dependency(%q<directory_watcher>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
  end
end

