require 'json'
require_relative 'item'
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
    JSON.pretty_generate({
      id: @id,
      name: @name
    })
  end
end