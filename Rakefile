require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "trigger-happy"
  gem.homepage = "http://github.com/alexgb/trigger-happy"
  gem.license = "MIT"
  gem.summary = %Q{Browser page refreshing for your web projects}
  gem.description = %Q{TriggerHappy watches a directory of files and tells browser pages, activated with a bookmarklet, to refresh when changes are detected}
  gem.email = "alex.gibbons@gmail.com"
  gem.authors = ["Alex Gibbons"]
  gem.bindir = "bin"
  gem.add_dependency 'em-websocket'
  gem.add_dependency 'directory_watcher'
end
Jeweler::RubygemsDotOrgTasks.new
