# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rfc-3339-attributes}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Manfred Stienstra"]
  s.date = %q{2010-07-05}
  s.description = %q{A tiny Rails plugin to allow validation on RFC-3339 datetime attributes.}
  s.email = %q{manfred@fngtps.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION.yml",
     "lib/active_record/rfc_3339_attributes.rb",
     "rails/init.rb",
     "test/rfc_3339_attributes_test.rb",
     "test/test_helper.rb"
  ]
  s.homepage = %q{http://fingertips.github.com}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{A tiny Rails plugin to allow validation on RFC-3339 datetime attributes.}
  s.test_files = [
    "test/rfc_3339_attributes_test.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

