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
    post '/'  params={"token"=>"", "team_id"=>"", "team_domain"=>"", "service_id"=>"", "channel_id"=>"", "channel_name"=>"bot", "timestamp"=>"1394805370.000014", "user_id"=>"", "user_name"=>"jin", "text"=>"dramabot lastfm jinp6301", "trigger_word"=>"dramabot"}
    assert last_response.ok?
    assert_equal 'Hello World', last_response.body
  end

  def test_it_says_hello_to_a_person
    get '/', :name => 'Simon'
    assert last_response.body.include?('Simon')
  end
end