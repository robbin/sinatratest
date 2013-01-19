ENV["RACK_ENV"] = "test"
require File.expand_path('../../boot', __FILE__)

require 'test/unit'
require 'rack/test'
# require 'active_support/test_case'
# require 'active_record/test_case'
# 
# class ActiveSupport::TestCase
#   setup do
#     ActiveRecord::IdentityMap.clear
#   end
#   
# end
