require 'spec_helper'
require 'rspec/its'
require_relative '../games.rb'

games = Games.new

describe Games do
  #getting list all games
  #should be array & size>0 
  describe "#get_all" do
      subject { games.get_all }
      it { should be_a_kind_of(Array) }
      its (:length) { should_not eq 0 }
      it { should include({
          'title' => "Kingdom Hearts HD 2.5 ReMIX",
          'score' => 82
          })
      }
  end

  #get_game by name, should be Hash with content
  describe "#get_game with correct value" do
    subject { games.get_game('Syberia')}
    it {should be_a_kind_of(Hash)}
    its (:length) { should eq 2}
    it { should include "title" => "Syberia" }
  end

  #get_game by name (doesn't exist), should be nil
  describe "#get_game with incorrect value" do
    subject { games.get_game('test_game')}
    it {should be nil}
  end
end
