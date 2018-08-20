require 'sinatra'
require 'sinatra/activerecord'
require 'securerandom'
enable :sessions

set :database, 'sqlite3:log-in.sqlite3'

get '/' do 
    erb :home
end

get '/login' do 
    erb :login
end

post '/login' do
    email = params['email']
    given_password = params['password'] 

    # check if email exists
    # check to see if the email has a password that matches the form password
    # if they match, log in the user

    user = User.find_by(email: email)
    if user.password == given_password
        session[:user] = user
        redirect :account
    else
        p 'Invalid credentials'
        redirect '/'
    end
end

get '/account' do
    erb :account
end

get '/signup' do
    erb :signup
end

post '/signup' do
    p params
    user = User.new(
        email: params['email'],
        name: params['fullname'],
        password: params['password']
    )

    user.save
    redirect '/'
end

get '/logout' do
    session[:user] = nil 
    p "user has logged out"
    redirect '/'
end

require './models'