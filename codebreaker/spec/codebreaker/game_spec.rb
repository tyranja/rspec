require 'spec_helper'
require 'stringio'

module Codebreaker
  describe Game do
    let(:output)  {StringIO.new}
    let(:game)    { Game.new(output) }

    describe '#start' do
      it "sends a welcome message" do
        # expect(output.puts).to be == "Welcome to Codebreaker!"
        game.start('1234')
        output.seek(0)
        expect(output.read).to include('Welcome to Codebreaker!')
      end

      it "prompts for the first guess" do
        # output.should_receive(:puts).with('Enter guess:')
        game.start('1234')
        output.seek(0)
        expect(output.read).to include('Enter guess:')
      end
    end

    describe '#guess' do
      context "with no matches" do
        it "sends a mark with ''" do
          game.start('1234')
          game.guess('5555')
          expect(output.read).to eq("")
        end
      end
    end
  end
end
