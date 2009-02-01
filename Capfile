# Taken and tweaked from http://railstips.org/2008/12/15/deploying-sinatra-on-dreamhost-with-passenger
load 'deploy' if respond_to?(:namespace) # cap2 differentiator

default_run_options[:pty] = true

# be sure to change these
set :user, 'jmcanally'
set :domain, 'tweetprompt.com'
set :application, 'tweetprompt'

# the rest should be good
set :repository,  "git://github.com/jeremymcanally/tweetprompt.git"
set :deploy_to, "/home/#{user}/#{domain}"
set :deploy_via, :remote_cache
set :scm, 'git'
set :branch, 'master'
set :git_shallow_clone, 1
set :scm_verbose, true
set :use_sudo, false

server "tweetprompt.com", :app, :web

namespace :deploy do
  task :restart do
    run "touch #{current_path}/tmp/restart.txt" 
  end
end