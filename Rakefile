require_relative("config/application")

Rails.application.load_tasks
Rake::Task["default"].clear

task(:default) do
  Rake::Task["brakeman:check"].invoke
  Rake::Task["test"].invoke
  Rake::Task["test:js"].invoke
  Rake::Task["test:system"].invoke
end
