# require_relative '../classes/movie'

describe Movie do
  before :each do
    @movie = Movie.new('Lord of the rings', '2010-09-05', true)
  end

  describe '#new' do
    it 'creates an instance of the movie class' do
      @movie.should(be_an_instance_of(Movie))
    end
  end

  it 'throws an argument error when parameters are less than or greater than is expected' do
    -> { Movie.new '2001-06-09' }.should raise_error ArgumentError
  end

  describe 'tests for methods in movie class' do
    it 'should show if a movie can be archieved or not' do
      expect(@movie.can_be_archived?).to eql true
    end
  end
end
