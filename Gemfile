source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.4'
gem 'sqlite3', group: :development
gem 'pg', '0.18.1', group: :production
gem 'rails_12factor', group: :production
# Use Puma as the app server
gem 'puma'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 3.2'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# to send email
gem 'sendmail', '~> 0.0.1'
# to upload images
gem 'carrierwave'
# For different versions of an image
gem 'mini_magick'
# To use HAML
gem 'haml-rails'
# Get location by IP
gem 'geocoder'
# Pagination gem
gem 'will_paginate', '>= 3.1'
# Bootstrap
gem 'bootstrap-sass', '~> 3.3.6'
# Internationalization
gem 'i18n'
# Authentification gem
gem 'devise'
# To make authentification with social networks
gem 'omniauth', '~> 1.6', '>= 1.6.1'
gem 'omniauth-facebook'
# Exception Notification
gem 'exception_notification'
gem 'letter_opener', group: :development
# Form usage
gem 'simple_form', git: 'git://github.com/plataformatec/simple_form'
# Use jquery as the JavaScript library
gem 'jquery-rails'

group :test do
   gem 'rspec-rails'
   gem 'factory_girl_rails'
   gem 'rails-controller-testing'
end

# to work with pdf
gem 'prawn'
gem 'render_anywhere'
gem 'wkhtmltopdf-binary'
gem 'wicked_pdf'
gem 'pdfkit'
# to send mails
gem 'pony'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # check if code is well-written
  gem 'rubocop', require: false
  # check if exist some security warnings
  gem 'brakeman', :require => false
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
