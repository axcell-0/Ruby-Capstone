class Source
  attr_reader :id, :name
  attr_accessor :items

  def initialize(name)
    @id = Random.rand(1...100)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_source(self) unless item.source == self
  end

  def to_h
    {
      id: @id,
      name: @name
    }
  end
end
