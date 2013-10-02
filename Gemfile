source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '4.0.0'
gem 'jquery-rails'
gem 'sass-rails', '~> 4.0.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'bootstrap-sass'
gem 'uglifier', '>= 1.3.0'
gem 'newrelic_rpm'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'figaro'

group :development do
	gem 'sqlite3'
end

group :development, :test do
	gem 'rspec-rails'
	gem 'factory_girl_rails'
	gem 'terminal-notifier-guard'
end

group :test do
	gem 'capybara'
	gem 'database_cleaner', '1.0.1'
	gem 'spork-rails', github: 'sporkrb/spork-rails'
	gem 'guard-rspec'
	gem 'guard-spork'
	gem 'rb-fsevent'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :production do
	gem 'pg'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]