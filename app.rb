require 'sinatra'
require 'sinatra/json'
require 'sinatra/reloader' if development?
require 'redis'
require_relative 'lib/my_redis'

get '/strings' do
  @strings = MyRedis.lrange('strings', 0, -1) || []

  erb :strings
end

get '/new-string' do
  erb :new
end

post '/add-string' do
  @string = params[:string]

  MyRedis.rpush('strings', @string)

  erb :success
end
