require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "rfc-3339-attributes"
    s.summary = s.description = "A tiny Rails plugin to allow validation on RFC-3339 datetime attributes."
    s.homepage = "http://fingertips.github.com"
    s.email = "manfred@fngtps.com"
    s.authors = ["Manfred Stienstra"]
  end
rescue LoadError
end