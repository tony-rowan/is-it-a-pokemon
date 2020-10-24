# frozen_string_literal: true

require_relative "boot"

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_view/railtie"
require "sprockets/railtie"
require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module IsItAPokemon
  class Application < Rails::Application
    config.load_defaults 6.0

    config.generators do |g|
      g.test_framework :minitest, spec: true, fixture: false
    end
  end
end
