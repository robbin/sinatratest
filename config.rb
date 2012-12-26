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
logger = ::Logger.new("log/#{ENV["RACK_ENV"]}.log")
if ENV["RACK_ENV"] == "production"
  logger.level = Logger::WARN
else
  logger.level = Logger::DEBUG
end
# use Rack::CommonLogger, logger

# initialize json
require 'json'
require 'active_support'
# ActiveSupport::JSON::Encoding.escape_html_entities_in_json = true

# initialize ActiveRecord
require 'active_record'
ActiveRecord::Base.establish_connection YAML::load(File.open('config/database.yml'))[ENV["RACK_ENV"]]
ActiveRecord::Base.logger = logger
ActiveSupport.on_load(:active_record) {self.include_root_in_json = false}

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
