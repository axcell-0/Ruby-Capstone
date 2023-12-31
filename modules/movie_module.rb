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

  def input_date
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
    published_date = input_date

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
    puts 'Movie created successfully!'
    puts '___________________________'
  end

  def list_all_movies
    if !File.exist?(MOVIE_PATH) || File.empty?(MOVIE_PATH)
      puts 'No Movies have been added yet'
      return
    end
    puts 'Movies:'
    data = JSON.parse(File.read(MOVIE_PATH))
    # rubocop:disable Layout/LineLength
    data.each_with_index do |movie, index|
      puts "  #{index + 1}) ID: #{movie['id']}, Title: #{movie['title']}, Genre: #{movie['genre']['name']}, Publish_date: #{movie['publish_date']}"
    end
    # rubocop:enable Layout/LineLength
  end
end
