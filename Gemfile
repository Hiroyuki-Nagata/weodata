source 'https://rubygems.org'

gem 'rake'
gem 'hanami',       '~> 1.0'
gem 'hanami-model', '~> 1.0'
gem 'hanami-utils'

group :test, :development do
  gem 'dotenv', '~> 2.0'
  gem 'jdbc-sqlite3'
  gem 'pry'
end

group :production do
  gem 'jruby-pg', '~> 0.1', platform: :jruby
  gem 'jruby-rack'
  gem 'mizuno'
end

group :test do
  gem 'minitest'
  gem 'capybara'
end
