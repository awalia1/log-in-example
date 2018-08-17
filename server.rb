require 'sinatra'
require 'sinatra/activerecord'
require 'securerandom'
enable :sessions

set :database, "sqlite3:log-in.sqlite3"

get "/" do 
	p "Sinatra is running"
end

get "/login" do 
	erb :login
end

post "/login" do
	@email = params["email"]
	@password = params["password"]

	p "Your email is, #{params['email']}"
	p "Your email is, #{params['password']}"

	redirect :account
end

get '/account' do
 	erb :account
end

get '/signup' do
 	erb :signup
end

post '/signup' do
 	p params
end

require './models'