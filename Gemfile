source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.8", ">= 7.0.8.1"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  # gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"

end

gem 'activerecord-import'
# Use Json Web Token (JWT) for token based authentication
gem 'jwt'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

gem 'rgeo'
gem 'rgeo-activerecord'
gem 'rgeo-geojson'

gem 'devise'
gem 'devise_invitable', '~> 2.0.0'
gem 'pundit'

gem 'simple_form'
gem 'cocoon'
gem 'bootstrap-glyphicons'

gem 'stateful_enum'

gem 'kaminari'

gem 'bootstrap4-kaminari-views'
gem 'sidekiq'
gem 'sidekiq-scheduler'
gem 'rake'
gem 'fcm'

gem 'caxlsx'
gem 'caxlsx_rails'

gem 'sentry-ruby'
gem 'sentry-rails'

gem 'image_processing', ">= 1.2"
gem 'activestorage-validator'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap',  require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'rspec-rails'
  gem 'rspec-default_http_header'
  gem 'factory_bot'
  gem 'faker'
  gem 'timecop'
  gem 'database_cleaner-active_record'
  gem 'webdrivers'
  gem 'cucumber-rails', require: false
  gem 'capybara-screenshot'
  gem 'show_me_the_cookies'
  # Easy installation and use of web drivers to run system tests with browsers
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'rubocop'

  gem 'capistrano', '~> 3.11'
  gem 'ed25519', '>= 1.2', '< 2.0'
  gem 'bcrypt_pbkdf', '>= 1.0', '< 2.0'

  gem 'annotate'
end

group :test do
  gem 'fuubar'
  gem 'simplecov', '~> 0.19.0', require: false
end

gem 'rails-settings-cached', '~> 2.2'

# Use the Puma web server [https://github.com/puma/puma]
# gem "puma", "~> 5.0"
gem "webrick", "~> 1.8"

gem 'pry'
gem 'byebug'
gem 'pry-byebug'
# gem "web-console"
gem 'better_errors'
gem 'binding_of_caller'
gem 'better_errors-pry'
gem "net-http-persistent", "~> 4.0"

gem "benchmark", "~> 0.3.0"
