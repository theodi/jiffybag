# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jiffybag/version'

Gem::Specification.new do |spec|
  spec.name          = "jiffybag"
  spec.version       = JiffyBag::VERSION
  spec.authors       = ["James Smith"]
  spec.email         = ["james@floppy.org.uk"]
  spec.summary       = %q{A safer environment variable loader, that wraps around dotenv}
  spec.description   = %q{JiffyBag lets you specify easily which environment variables should be present, and will raise an exception if they're not set at configure-time, or if you try to use vairables that were't specified.}
  spec.homepage      = "https://github.com/theodi/jiffybag"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  
  spec.add_dependency "dotenv", "~> 1.0"
  
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "coveralls", "~> 0.7"
  
end
