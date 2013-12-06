# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shogi_koma/version'

Gem::Specification.new do |spec|
  spec.name          = "shogi_koma"
  spec.version       = ShogiKoma::VERSION
  spec.authors       = ["Masafumi Yokoyama"]
  spec.email         = ["myokoym@gmail.com"]
  spec.description   = %q{An image generator for Shogi's pieces (it's "ko-ma" in Japanese) for Ruby by cairo.}
  spec.summary       = %q{An image generater for Shogi's pieces}
  spec.homepage      = "https://github.com/myokoym/shogi_koma"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) {|f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency("cairo")

  spec.add_development_dependency("bundler", "~> 1.3")
  spec.add_development_dependency("rake")
end
