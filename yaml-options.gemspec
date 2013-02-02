require File.expand_path("../.gemspec", __FILE__)
require File.expand_path("../lib/yaml/options/version", __FILE__)

Gem::Specification.new do |gem|
  gem.name        = "yaml-options"
  gem.authors     = ["Samuel Kadolph"]
  gem.email       = ["samuel@kadolph.com"]
  gem.description = readme.description
  gem.summary     = readme.summary
  gem.homepage    = "https://github.com/samuelkadolph/yaml-options"
  gem.version     = YAML::Options::VERSION

  gem.files       = Dir["lib/**/*"]
  gem.test_files  = Dir["test/**/*_test.rb"]

  gem.required_ruby_version = ">= 1.9.2"

  gem.add_dependency "activesupport", "~> 3.2"

  gem.add_development_dependency "rake", "~> 10.0.3"
end
