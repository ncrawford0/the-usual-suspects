# This file is used by Rack-based servers to start the application.

require './server'

# disable buffering for Heroku Logplex
$stdout.sync = true

require ::File.expand_path('../config/environment',  __FILE__)
run Rails.application
