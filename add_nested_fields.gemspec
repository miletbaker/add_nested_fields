# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{add_nested_fields}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jon Baker. Go Tripod Ltd"]
  s.date = %q{2009-09-29}
  s.description = %q{Adds two RJS helper methods to help work with accepts_nested_attributes_for and partials. Based on the method suggested by Marsvin on RailsForum.com}
  s.email = %q{jon@gotripod.com}
  s.extra_rdoc_files = ["README.md", "lib/add_nested_fields.rb", "tasks/add_nested_fields_tasks.rake"]
  s.files = ["README.md", "Rakefile", "init.rb", "install.rb", "lib/add_nested_fields.rb", "tasks/add_nested_fields_tasks.rake", "uninstall.rb"]
  s.homepage = %q{http://github.com/miletbaker/add_nested_fields}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Add Nested Fields", "--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{add_nested_fields}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Adds two RJS helper methods to help work with accepts_nested_attributes_for and partials.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
