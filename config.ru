require './env' if File.exists?('env.rb')
require './jinslackbot.rb'

run Sinatra::Application