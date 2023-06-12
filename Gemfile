source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1', '>= 6.1.7.3'
#  PUMA WEBAPP Server
gem 'puma', '~> 6.3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 6.0'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.4', '>= 5.4.4'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5.2', '>= 5.2.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.11', '>= 2.11.5'
gem 'net-http', '~> 0.3.2'

gem 'haml', '~> 6.1', '>= 6.1.1'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '~> 1.16', require: false

# USERS
gem 'devise',     '~> 4.9', '>= 4.9.2'
gem 'omniauth',   '~> 2.1', '>= 2.1.1'
gem 'recaptcha',  '~> 5.14'

group :production do
  # Using POSTGRESQL for Production only (Heroku)
  gem 'pg', '~> 1.5', '>= 1.5.3'
end

group :development, :test do
  gem 'better_errors', '~> 2.10'
  gem 'binding_of_caller', '~> 1.0'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'letter_opener', '~> 1.8', '>= 1.8.1'
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '~> 1.6', '>= 1.6.2'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'annotate', '~> 3.2'
  gem 'bullet', '~> 7.0', '>= 7.0.7'
  gem 'marginalia', '~> 1.11', '>= 1.11.1'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'web-console', '>= 4.1.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver', '~> 4.10'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers', '~> 5.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', '~> 1.2023', '>= 1.2023.3', platforms: %i[mingw mswin x64_mingw jruby]
