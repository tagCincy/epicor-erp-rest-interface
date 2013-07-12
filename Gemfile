source 'https://rubygems.org'

gem 'rails', '3.2.13'


platform :jruby do
	gem 'activerecord-jdbcsqlite3-adapter'
	gem 'jruby-openssl'
	gem 'therubyrhino'
	gem 'warbler'
end

platform :ruby do
	gem 'sqlite3'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'rspec-instafail'
  gem 'guard-rspec'
end

gem 'savon'
