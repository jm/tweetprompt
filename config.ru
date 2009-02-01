require 'rubygems'
require 'vendor/sinatra/lib/sinatra.rb'
require 'vendor/faker/lib/faker.rb'

path = "/home/jmcanally/tweetprompt.com/current"

Sinatra::Application.default_options.merge!(
  :root => path,
  :views => path + '/views',
  :public => path + '/public',
  :run => false,
  :env => :production
)

require 'app.rb'
run Sinatra.application