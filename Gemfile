source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.3"

gem "importmap-rails"
gem "sprockets-rails"
gem "pg"
gem "puma"
gem "turbo-rails"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "redis"

group :development, :test do
  gem "foreman"
end

group :development do
  gem "standard"
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
