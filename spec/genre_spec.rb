require 'rspec'
require './lib/genre'
require 'json'

describe Genre do
  context '#add_item' do
    it 'should add item to the Item array and call save_genre on item with self as argument' do
      genre = Genre.new('Rock')
      fake_item = double('fake item')
      allow(fake_item).to receive(:save_genre=)

      genre.add_item(fake_item)

      expect(genre.items).to include(fake_item)
      expect(fake_item).to have_received(:save_genre=).with(genre)
    end
  end
  context '#to_json_string' do
    it 'Should return JSON string version of itself' do
      genre = Genre.new('Rock')
      double('test_item', id: '234', name: 'test')

      json = {
        JSON.create_id => genre.class.name,
        id: genre.id,
        name: 'Rock'
      }

      result = genre.to_json

      expect(result).to eq(JSON.pretty_generate(json))
    end
  end
end
