require 'spec_helper'
require 'rack/test'
require_relative '../app.rb'

describe 'Game list App' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  #test response for /games
  it "gets list of games" do
    get '/games'
    expect(last_response).to be_ok
    expect(last_response.body).to include("Kingdom Hearts")
  end

  #test game retrieval by name
  it "gets a game by name" do
    get '/games/Syberia'
    expect(last_response).to be_ok
  end

  #test return (404) if game not found
  it "returns 404 if game searched doesn't exist" do
    get '/games/testGame'
    expect(last_response.status).to eq 404
  end 
end
