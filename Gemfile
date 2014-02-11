source 'https://rubygems.org'

gem 'rails', '3.2.16'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'devise'
gem 'paperclip', '~> 3.0'
gem 'sidekiq'
# gem 'sinatra', '>= 1.3.0', :require => nil

group :production do
  gem 'mysql2'
end

group :development do
  gem 'sqlite3'
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'compass-rails'
  gem 'bootstrap-sass-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'rr'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'shoulda'
end

gem 'jquery-rails'
gem 'stripe', :git => 'https://github.com/stripe/stripe-ruby'

# Deploy with Capistrano
gem 'capistrano', '< 3.0'

# To use debugger
# gem 'debugger'
