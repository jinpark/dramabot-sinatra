ENV['RACK_ENV'] = 'test'

require 'jinslackbot'
require 'test/unit'
require 'rack/test'

class JinSlackBot < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_weather
    post '/'  params={}
    assert last_response.ok?
    assert_equal 'Hello World', last_response.body
  end

  def test_it_says_hello_to_a_person
    get '/', :name => 'Simon'
    assert last_response.body.include?('Simon')
  end
end