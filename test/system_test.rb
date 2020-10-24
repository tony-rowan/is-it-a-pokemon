# frozen_string_literal: true

require "test_helper"
require "minitest/rails/capybara"

class SystemTest < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :headless_chrome, screen_size: [800, 600]

  register_spec_type(self) do |_desc, *addl|
    addl.include? :system
  end

  def teardown
    errors = page.driver.browser.manage.logs.get(:browser).select do |error|
      error.level == "FATAL" || error.level == "ERROR"
    end

    return unless errors.present?

    warn "====="
    warn "Test Produced Javascript Logs"
    warn "---"
    errors.each { |e| warn "#{e.level}: #{e.message}" }
    warn "====="
  end
end
