require 'json'

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

  def to_json
    items_id = @items.map(&:id)
    JSON.pretty_generate(
      {
        JSON.create_id => self.class.name,
        id: @id,
        name: @name,
        items: items_id
      }
    )
  end
end