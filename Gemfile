source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 4.3'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Will Paginate
gem 'will_paginate', '~> 3.3.0'
# Devise Invitable
gem 'devise_invitable', '~> 2.0.0'
# Ransack
gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'image_processing'
gem 'caxlsx'
gem 'caxlsx_rails'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  case RUBY_PLATFORM
  when /darwin/
    gem 'wkhtmltopdf-binary-edge', '~> 0.12.5.1'
  when /linux/
    gem 'wkhtmltopdf-binary', '~> 0.12.6'
  end

end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the   background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
end

group :development, :test do
  gem 'rspec-rails', '~> 4.0.0'
  gem 'dotenv-rails'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'activeadmin'
gem 'devise'
gem 'cancancan'
gem 'draper'
gem 'factory_bot_rails'
gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'
gem 'geocoder'
gem "letter_opener", :group => :development
gem 'twilio-ruby'
gem "combined_time_select", "~> 2.0.0"
gem 'exception_notification'
gem 'slack-notifier'
gem 'chronic'
gem 'aasm'
gem 'phonelib'
gem "aws-sdk-s3", require: false
gem 'wicked_pdf'
gem 'wkhtmltopdf-heroku', '2.12.5.0', group: :production
gem 'rails-erd', group: :development
