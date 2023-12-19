require 'rspec'
require './lib/music_album'
require './lib/item'

describe MusicAlbum do
  let(:music_album) { MusicAlbum.new('2023-01-01', true) }

  describe 'attributes' do
    it 'Should have the correct publish date' do
      expect(music_album.publish_date).to eq('2023-01-01')
    end

    it 'should not be on Spotify' do
      expect(music_album.on_spotify).to be(true)
    end
  end

  describe '#can_be_archived?' do
    it 'returns false if publish date is less than 10 years old or if its not on spotify' do
      music_album.publish_date = '2021-01-01'
      expect(music_album.can_be_archived?).to be false
    end
  end
end
