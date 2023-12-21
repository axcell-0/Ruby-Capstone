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

  def to_json(*_args)
<<<<<<< HEAD
    items_id = @items.map(&:id)
=======
>>>>>>> b7e3f65b95ebd7c6567d67ec9e95de3c0c67683f
    JSON.pretty_generate(
      {
        JSON.create_id => self.class.name,
        id: @id,
        name: @name
      }
    )
  end
end
