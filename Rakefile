# frozen_string_literal: true

# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"
require "rubocop/rake_task"

Rails.application.load_tasks
RuboCop::RakeTask.new

Rake::Task["default"].clear

task :default do
  Rake::Task["brakeman:check"].invoke
  Rake::Task["rubocop"].invoke
  Rake::Task["test"].invoke
  Rake::Task["test:system"].invoke
end
