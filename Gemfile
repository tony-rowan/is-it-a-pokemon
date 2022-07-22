source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.3"

gem "bootsnap", require: false
gem "importmap-rails"
gem "pg"
gem "puma"
gem "redis"
gem "sprockets-rails"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "turbo-rails"

group :development, :test do
  gem "factory_bot_rails"
  gem "rspec-rails"
end

group :development do
  gem "foreman"
  gem "lefthook"
  gem "standard"
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
