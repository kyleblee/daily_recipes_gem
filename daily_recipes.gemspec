# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'daily_recipes/version'

Gem::Specification.new do |spec|
  spec.name          = "daily_recipes"
  spec.version       = DailyRecipes::VERSION
  spec.authors       = ["Kyle Lee"]
  spec.email         = ["hello.kylelee@gmail.com"]

  spec.summary       = %q{Recipes of the day}
  spec.description   = %q{Recipes of the day}
  spec.homepage      = "https://github.com/kyleblee/daily_recipes_gem"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.10.3"
  spec.add_dependency "nokogiri", "~> 1.8"
end
