# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'news_headlines/version'

Gem::Specification.new do |spec|
  spec.name          = "news_headlines"
  spec.version       = NewsHeadlines::VERSION
  spec.authors       = ["'Sergio Correa'"]
  spec.email         = ["'correa.sergio@gmail.com'"]

  spec.summary       = %q{news headlines CLI}
  spec.description   = %q{Shows user list of news sources and their latest headlines}
  spec.homepage      = "https://github.com/scorrea83/news_headlines/blob/master/README.md"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  spec.add_runtime_dependency "rest-client"
  spec.add_runtime_dependency "json"
end
