# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task default: :spec
task test: :spec

require "yard"
YARD::Rake::YardocTask.new

desc "Generates all documentation"
task docs: [:yard]
