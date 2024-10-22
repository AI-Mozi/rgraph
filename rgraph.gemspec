# frozen_string_literal: true

require_relative "lib/rgraph/version"

Gem::Specification.new do |spec|
  spec.name = "rgraph"
  spec.version = RGraph::VERSION
  spec.authors = ["AI-Mozi"]
  spec.email = ["bieniek.milosz0@gmail.com"]

  spec.summary = "Ruby FFI bindings for igraph library."
  spec.description = "Ruby FFI bindings for igraph library."
  spec.homepage = "https://github.com/AI-Mozi/rgraph"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["allowed_push_host"] = "https://github.com/AI-Mozi/rgraph"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/AI-Mozi/rgraph"
  spec.metadata["changelog_uri"] = "https://github.com/AI-Mozi/rgraph"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "ffi", "~> 1.16"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata["rubygems_mfa_required"] = "true"
end
