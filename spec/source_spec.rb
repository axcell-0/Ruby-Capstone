# frozen_string_literal: true

require_relative '../classes/source_class'

describe Source do
  before(:each) do
    @source = Source.new('Source Name')
    @item = double('Item')
  end

  it 'has an id' do
    expect(@source).to be_an_instance_of Source
  end

  it 'has a name' do
    expect(@source.name).to eq('Source Name')
  end

  it 'can add an item' do
    allow(@item).to receive(:source).and_return(@source)
    @source.add_item(@item)
    expect(@source.items).to include(@item)
  end
end
