require 'sinatra'
require 'json'
require './games.rb'

#set Sinatra port
set :port, 8888

#instatiate Games class
games = Games.new

#return all games in JSON format
get '/games' do
  content_type :json
  games.get_all.to_json
end

#return wanted game in JSON format
#return 404 if games doesn't exist
get '/games/:name' do
  result = games.get_game(params[:name])
  return status 404 if result.nil?
  content_type :json
  result.to_json
end
