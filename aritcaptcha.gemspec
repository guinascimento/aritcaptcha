# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{aritcaptcha}
  s.version = "2.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Guilherme Nascimento"]
  s.date = %q{2011-05-12}
  s.description = %q{Arithmetic Captcha}
  s.email = %q{guilherme.ruby@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.markdown"
  ]
  s.files = [
    ".document",
    "LICENSE",
    "README.markdown",
    "Rakefile",
    "VERSION",
    "aritcaptcha.gemspec",
    "lib/aritcaptcha.rb",
    "lib/aritcaptcha/aritcaptcha_helper.rb",
    "lib/aritcaptcha/aritcaptcha_verify.rb",
    "lib/aritcaptcha/calculation.rb",
    "spec/aritcaptcha_spec.rb",
    "spec/spec.opts",
    "spec/spec_helper.rb",
    "tags"
  ]
  s.homepage = %q{http://github.com/guinascimento/aritcaptcha}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Arithmetic Captcha}
  s.test_files = [
    "spec/aritcaptcha_spec.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
    else
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
  end
end

