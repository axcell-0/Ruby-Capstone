require 'rspec'
require_relative '../lib/item'
require_relative '../lib/game'

describe Game do
  let(:game) { Game.new(true, '2019-10-17', '2022-10-17') }

  describe 'attributes' do
    it 'has the correct multiplayer attribute' do
      expect(game.multiplayer).to be(true)
    end

    it 'has the correct last_played_at attribute' do
      expect(game.last_played_at).to eq('2019-10-17')
    end

    it 'has the correct publish_date attribute' do
      expect(game.publish_date).to eq('2022-10-17')
    end
  end
end