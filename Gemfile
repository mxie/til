source 'https://rubygems.org'

ruby '1.9.3'

gem 'rails'
gem 'pg'
gem 'jquery-rails'
gem 'clearance', github: 'thoughtbot/clearance', tag: 'v1.0.0.rc4'
gem 'thin'
gem 'high_voltage'
gem 'paperclip'
gem 'simple_form'
gem 'flutie'
gem 'bourbon'
gem 'neat'
gem 'airbrake'
gem 'acts-as-taggable-on', '~> 2.3.3'
gem 'will_paginate', '~> 3.0'

group :development do
  gem 'foreman'
end

group :development, :test do
  gem 'guard'
  gem 'guard-spork'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'sham_rack'
end

group :test do
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'factory_girl_rails'
  gem 'bourne'
  gem 'database_cleaner'
  gem 'timecop'
  gem 'shoulda-matchers'
  gem 'launchy'
  gem 'simplecov', require: false
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :staging, :production do
  gem "newrelic_rpm", "~> 3.5.8.72"
end
