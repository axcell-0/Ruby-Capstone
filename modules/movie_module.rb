require_relative '../classes/movie'
require_relative '../classes/author'

require_relative 'preserve_module'
require_relative 'utils'

module MovieModule
  include Preserve
  include Utils

  def add_movie
    puts 'Movie Title: '
    movie_title = gets.chomp

    puts 'Published Date: '
    published_date = gets.chomp

    print 'Is it a silent movie? [Y/N]: '
    silent = gets.chomp.to_s.downcase == 'y'

    movie = Movie.new(published_date, movie_title, silent)
    movie_data = { title: movie_title, publish_date: published_date, silent: silent }
    stored_data = fetch_file('movies')
    stored_data.push(movie_data)
    update_data('movies', stored_data)
    @movies << movie
    add_list('source')
    list_source

    select_options('source')
    source_option = gets.chomp.to_i
    if source_option == 1
      print 'ID of the source: '
      id_source = gets.chomp.to_i
      @source.each do |source|
        movie.add_source(source) if source.id == id_source
      end
    else
      print 'Name: '
      name = gets.chomp
      source = Source.new(name)
      source_data = { name: name }
      stored_data = fetch_file('source')
      stored_data.push(source_data)
      update_data('source', stored_data)
      @source << source
      source.add_item(movie)
    end
  end

  def list_movies
    puts 'No available movie' if @source.empty?
    @movies.each_with_index do |value, index|
      puts "#{index + 1}) Title: #{value.title}, Silent: #{value.silent}, Publish date: #{value.publish_date}"
    end
  end

  def list_source
    puts 'No available source' if @source.empty?
    @source.each_with_index do |value, index|
      puts "#{index + 1}) Source Name: #{value.name}, Source ID: #{value.id}"
    end
  end
end
