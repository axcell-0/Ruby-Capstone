require 'json'

class Author
  attr_accessor :first_name, :last_name, :items, :id

  def initialize(first_name, last_name, id = Random.rand(1..1000))
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    item.author = self
    @items << item
  end

  def to_json(option = {})
    {
      id: @id,
      first_name: @first_name,
      last_name: @last_name
    }.to_json(option)
  end
end
