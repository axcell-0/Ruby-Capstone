require 'rspec'
require './lib/author'


describe Author do
  before(:each) do
    @author = Author.new('FirstName', 'LastName')
    @author.id = 1
    @author.items = []
  end

  describe '#initialize constructor' do
    it 'Checking Game instance' do
      expect(@author).to be_an_instance_of(Author)
    end

    it 'Checking the first_name' do
      expect(@author.first_name).to eq('FirstName')
    end

    it 'Checking the last_name' do
      expect(@author.last_name).to eq('LastName')
    end
  end

  describe '#add_item method' do
    it 'should add the author to items' do
      item = double('item')
      allow(item).to receive(:save_author=)
      @author.add_item(item)
      expect(@author.items).to eq([item])
    end
  end

  describe '#to_json method' do
    it 'should return the object of author' do
      expect(@author.to_json).to eq('{"id":1,"first_name":"FirstName","last_name":"LastName"}')
    end
  end
end