# frozen_string_literal: true

require_relative '../classes/movie_class'
require_relative '../classes/author_class'
require_relative '../classes/source_class'

describe Movie do
  before(:each) do
    @publish_date = Date.new(2023, 2, 12)
    @movie = Movie.new('Movie Title', false, 'Action', 'Movie Label', @publish_date)
  end

  it 'has a title' do
    expect(@movie.title).to eq('Movie Title')
  end

  it 'is not silent by default' do
    expect(@movie.silet).to be(false)
  end

  it 'has a genre' do
    expect(@movie.genre).to eq('Action')
  end

  it 'has a label' do
    expect(@movie.label).to eq('Movie Label')
  end

  it 'can be archived if it is silent' do
    @movie.silet = true
    expect(@movie.can_be_archived?).to be(true)
  end

  it 'can be archived if it is past the publish date' do
    @publish_date = Date.new(2021, 1, 1)
    @movie = Movie.new('Movie Title', false, 'Action', 'Movie Label', @publish_date)
    expect(@movie.can_be_archived?).to be(true)
  end

  it 'cannot be archived if it is not silent and not past the publish date' do
    expect(@movie.can_be_archived?).to be(true)
  end

  it 'can be moved to archive if it can be archived' do
    @movie.silet = true
    @movie.move_to_archive
    expect(@movie.archived).to be(true)
  end

  it 'cannot be moved to archive if it cannot be archived' do
    @movie.move_to_archive
    expect(@movie.archived).to be(true)
  end

  it 'returns a hash representation' do
    expected_hash = {
      title: 'Movie Title',
      silet: false,
      genre: 'Action',
      publish_date: @publish_date,
      label: 'Movie Label'
    }
    expect(@movie.to_h).to eq(expected_hash)
  end
end
