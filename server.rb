require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:log-in.sqlite3"

require './models'