# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "automaildoc/version"

Gem::Specification.new do |spec|
  spec.name          = "automaildoc"
  spec.version       = Automaildoc::VERSION
  spec.authors       = ["Masato Ohba"]
  spec.email         = ["over.rye@gmail.com"]

  spec.summary       = "Generate mail preview from your mail spec"
  spec.description   = "Automaildoc is a gem to generate a list of about mails from your mail spec."
  spec.homepage      = "https://github.com/ohbarye/automaildoc"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rspec"
  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "mail"
end
