source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Specify your gem's dependencies in standards.gemspec.
gemspec


group :development do
  gem 'brakeman'
  gem 'bullet'
  gem 'haml_lint'
  gem 'letter_opener'
  gem 'listen'
  gem 'rails-erd'
  gem 'reek'
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'solargraph'
  gem 'unique_validation_inspector'
  gem 'web-console'
  gem 'yard'
end

group :development, :test do
  gem 'debug'
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'rswag-specs'
  gem 'spring'
  gem 'timecop'
  gem 'webmock'
end

group :test do
  gem 'faker'
  gem 'ffaker'
  gem 'json_matchers'
  gem 'rspec-html-matchers'
  gem 'rspec-json_expectations'
end