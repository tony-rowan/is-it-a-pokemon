require "test_helper"
require "minitest/rails/capybara"

class SystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :headless_chrome, screen_size: [800, 600]

  register_spec_type(self) do |desc, *addl|
    addl.include? :system
  end

  def teardown
    errors = page.driver.browser.manage.logs.get(:browser).select do |error|
      error.level == "FATAL" || error.level == "ERROR"
    end

    if errors.present?
      STDERR.puts("=====")
      STDERR.puts("Test Produced Javascript Logs")
      STDERR.puts("---")
      errors.each { |e| STDERR.puts("#{e.level}: #{e.message}") }
      STDERR.puts("=====")
    end
  end
end
