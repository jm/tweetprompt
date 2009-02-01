require 'rubygems'
require 'vendor/sinatra/lib/sinatra.rb'
require 'vendor/faker/lib/faker.rb'

path = "/home/jmcanally/tweetprompt.com/current"

configure do
  set :root, path
  set :views, path + '/views'
  set :public, path + '/public'
  set :run, false
  set :environment, :production
end

require 'app.rb'
run Sinatra::Application