require File.expand_path("../test_helper", __FILE__)

# class PostTest < ActiveSupport::TestCase
#   test "the truth" do
#     assert true
#   end
# end

class PostTest < Test::Unit::TestCase
  include Rack::Test::Methods
  def test_true
    assert true
  end
  # def app
  #   Sinatra::Application
  # end
  # 
  # def test_my_default
  #   get '/'
  #   assert_equal 'Hello World!', last_response.body
  # end
  # 
  # def test_with_params
  #   get '/meet', :name => 'Frank'
  #   assert_equal 'Hello Frank!', last_response.body
  # end
  # 
  # def test_with_rack_env
  #   get '/', {}, 'HTTP_USER_AGENT' => 'Songbird'
  #   assert_equal "You're using Songbird!", last_response.body
  # end
end  