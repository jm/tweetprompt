require 'rubygems'
require 'vendor/sinatra/lib/sinatra.rb'
require 'vendor/faker/lib/faker.rb'

path = "/home/jmcanally/tweetprompt.com/current"

set :root, path
set :views, path + '/views'
set :public, path + '/public'
set :environment, :production
disable :run

require 'app.rb'
run Sinatra::Application