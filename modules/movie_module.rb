require_relative '../lib/movie'
require_relative '../lib/author'
require './modules/genre_module'
require './modules/save_book_label_data'
require './modules/source_module'

module MovieModule
  MOVIE_PATH = './data/movies.json'.freeze
  def check_movie_file
    return if File.exist?(MOVIE_PATH)

    FileUtils.touch(MOVIE_PATH)
  end

  def get_date
    date_format_regex = /\A\d{4}-\d{2}-\d{2}\z/
    print 'Publish Date (yyyy-mm-dd): '
    date = gets.chomp
    until date.match?(date_format_regex)
      puts 'Invalid Date Format'
      print 'Publish Date (yyyy-mm-dd): '
      date = gets.chomp
    end
    date
  end

  def add_a_movie
    check_movie_file
    file = File.read(MOVIE_PATH)
    data = file.empty? ? [] : JSON.parse(file)
    print 'Movie Title: '
    movie_title = gets.chomp
    published_date = get_date

    print 'Is it a silent movie? [Y/N]: '
    silent = gets.chomp.to_s.downcase == 'y'

    movie = Movie.new(published_date, movie_title, silent)
    source = create_source
    label = create_label
    genre = create_genre
    label.add_item(movie)
    genre.add_item(movie)
    source.add_item(movie)
    data.push(JSON.parse(movie.to_json))
    File.write(MOVIE_PATH, JSON.pretty_generate(data))
  end

  # def list_movies
  #   puts 'No available movie' if @source.empty?
  #   @movies.each_with_index do |value, index|
  #     puts "#{index + 1}) Title: #{value.title}, Silent: #{value.silent}, Publish date: #{value.publish_date}"
  #   end
  # end

  # def list_source
  #   puts 'No available source' if @source.empty?
  #   @source.each_with_index do |value, index|
  #     puts "#{index + 1}) Source Name: #{value.name}, Source ID: #{value.id}"
  #   end
  # end
end
