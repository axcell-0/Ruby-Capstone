require 'rspec'
require '../lib/genre.rb'
class Genre
  attr_accessor :name, :items, :id

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.save_genre = self
  end

  def to_json_string
    items_id = @items.map(&:id)
    JSON.pretty_generate({
                           id: @id,
                           name: @name,
                           items: items_id
                         })
  end
end

describe Genre do
  let(:genre_name) { 'Rock' }

  context 'Initialize Genre' do
    it 'Should add item into items and call save_genre method on item, adding self as argument' do
      genre = Genre.new(genre_name)
      item = instance_double('Item')

      expect(item).to receive(:save_genre=).with(genre)

      genre.add_item(item)

      expect(genre.items).to include(item)
    end
  end

  context 'to_json_string' do
    it 'Should return the json string version of self' do
      genre = Genre.new(genre_name)
      item1 = instance_double('Item', id: 456, name: item_name + '1')
      item2 = instance_double('Item', id: 789, name: item_name + '2')


      genre.add_item(item1)
      genre.add_item(item2)

      expected_json = {
        id: genre.id,
        name: genre.name,
        items: [item1.id, item2.id]
      }.to_json

      expect(genre.to_json_string).to eq(JSON.pretty_generate(JSON.parse(expected_json)))
    end
  end
end