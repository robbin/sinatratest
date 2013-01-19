source "https://rubygems.org"

gem 'rack'
gem 'sinatra'

gem 'oj'
# gem 'yajl-ruby'

gem 'activerecord', :require => 'active_record'
gem 'mysql2'
gem 'dalli', :require => 'active_support/cache/dalli_store'
gem 'kgio'
gem "second_level_cache", :git => "git://github.com/csdn-dev/second_level_cache.git"

gem 'rake'
# gem 'pony'   # pony must be after activerecord

group :development do
  gem 'thin'
  gem 'pry'
  gem 'sinatra-contrib'
end

group :test do
  gem 'minitest', "~>2.6.0", :require => "minitest/autorun"
  gem 'factory_girl'
  gem 'database_cleaner'
end
