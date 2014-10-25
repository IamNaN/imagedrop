# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'imagedrop/version'

Gem::Specification.new do |spec|
  spec.name          = "imagedrop"
  spec.version       = Imagedrop::VERSION
  spec.authors       = ["Dave Gerton"]
  spec.email         = ["dgerton@gmail.com"]
  spec.summary       = %q{Good for avatars and such!}
  spec.description   = %q{Transforms the lowly file input field into a sophisticated looking drag and drop target, complete with preview image and placeholder text.}
  spec.homepage      = "http://iamnan.github.io/imagedrop"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  # spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  # spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
