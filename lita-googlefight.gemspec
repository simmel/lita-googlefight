Gem::Specification.new do |spec|
  spec.name          = "lita-googlefight"
  spec.version       = "1.0.0"
  spec.authors       = ["Simon Lundström"]
  spec.email         = ["simmel@soy.se"]
  spec.description   = "GoogleFight two terms: there can only be one winner."
  spec.summary       = "Fight to find out which has more hits on Google"
  spec.homepage      = "https://github.com/simmel/lita-googlefight"
  spec.license       = "ISC license"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 4.3"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "rspec", ">= 3.0.0"
end
