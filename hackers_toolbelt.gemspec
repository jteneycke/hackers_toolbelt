
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "hackers_toolbelt/version"

Gem::Specification.new do |spec|
  spec.name          = "hackers_toolbelt"
  spec.version       = HackersToolbelt::VERSION
  spec.authors       = ["Josh Teneycke"]
  spec.email         = ["josh.teneycke@gmail.com"]

  spec.summary       = %q{A hackers toolbelt for day to day use.}
  spec.description   = %q{}
  spec.homepage      = "https://github.com/jteneycke/ruby-toolbelt"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
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

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"

  spec.add_runtime_dependency "awesome_print"
  spec.add_runtime_dependency "chainable_methods"
  spec.add_runtime_dependency "clipboard"
  spec.add_runtime_dependency "colored"
  spec.add_runtime_dependency "http"
  spec.add_runtime_dependency "json"
  spec.add_runtime_dependency "nokogiri"
  spec.add_runtime_dependency "pry"
  spec.add_runtime_dependency "pry-doc"
  spec.add_runtime_dependency "sanitize"
  spec.add_runtime_dependency "smarter_csv"
  spec.add_runtime_dependency "sqlite3"
  spec.add_runtime_dependency "tty-prompt"

end
