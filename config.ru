require 'rubygems'
require 'vendor/sinatra/lib/sinatra.rb'

path = "/home/jmcanally/tweetprompt/current"

Sinatra::Application.default_options.merge!(
  :root => path,
  :views => path + '/views',
  :public => path + '/public',
  :run => false,
  :env => :production
)

require 'app.rb'
run Sinatra.application