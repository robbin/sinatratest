configure do
  # = Configuration =
  set :run,             false
  set :show_exceptions, development?
  set :raise_errors,    development?
  set :logging,         true
  set :static,          false # your upstream server should deal with those (nginx, Apache)
end

configure :production do
end  

# initialize log
require 'logger'
Dir.mkdir('log') unless File.exist?('log')
class ::Logger; alias_method :write, :<<; end
case ENV["RACK_ENV"]
when "production"
  logger = ::Logger.new("log/production.log")
  logger.level = ::Logger::WARN
when "development"
  logger = ::Logger.new(STDOUT)
  logger.level = ::Logger::DEBUG
else
  logger = ::Logger.new("/dev/null")
end
# use Rack::CommonLogger, logger

# initialize json
require 'oj'
# require 'yajl'
# require 'json'
# require 'active_support'
# ActiveSupport::JSON::Encoding.escape_html_entities_in_json = true

# initialize ActiveRecord
require 'active_record'
ActiveRecord::Base.establish_connection YAML::load(File.open('config/database.yml'))[ENV["RACK_ENV"]]
# ActiveRecord::Base.logger = logger
ActiveSupport.on_load(:active_record) do
  self.include_root_in_json = false
  self.default_timezone = :local
  self.time_zone_aware_attributes = false
  self.logger = logger
  # self.observers = :cacher, :garbage_collector, :forum_observer
end

# initialize memcache
require 'dalli'
require 'active_support/cache/dalli_store'
Dalli.logger = logger
CACHE = ActiveSupport::Cache::DalliStore.new("127.0.0.1")

# initialize ActiveRecord Cache
require 'second_level_cache'
SecondLevelCache.configure do |config|
  config.cache_store = CACHE
  config.logger = logger
  config.cache_key_prefix = 'domain'
end

# initialize I18n
I18n.default_locale = 'zh_cn'
Dir.glob(File.expand_path("../locale", __FILE__) + '/**/*.yml').each do |file|
  I18n.load_path << file
end

# release thread current connection return to connection pool in multi-thread mode
use ActiveRecord::ConnectionAdapters::ConnectionManagement