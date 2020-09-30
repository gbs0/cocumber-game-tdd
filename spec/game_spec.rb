require 'gosu'
require_relative '../game'

RSpec.describe Game do
  describe "#start" do
    it "Changes State Machine from :initial to :started" do 
      game = Game.new
      expect { 
      	game.start
      }.to change { game.state }.from(:initial).to(:started)
    end

    it  "Game Window is an instance of Gosu Window" do
    	expect { game.start }.to be_an_instance_of(Gosu::Window)
    end
  end

  describe "in the final phase" do
    context "when the player hits the target" do
      it "congratulates the player" do
      end
    end
  end
end