require_relative '../classes/source'
require_relative '../classes/item'

describe Source do
  before :each do
    @source = Source.new('Ronaldo')
  end

  describe '#new' do
    it 'creates an instance of the source class' do
      @source.should(be_an_instance_of(Source))
    end
  end

  it 'throws an argument error when parameters are less than or greater than is expected' do
    -> { Source.new }.should raise_error ArgumentError
  end

  describe 'tests for methods in source class' do
    it 'should add an item' do
      item = Item.new('2022-05-09')
      @source.add_item(item)
      expect(@source.items.length).to eql 1
    end
  end
end
