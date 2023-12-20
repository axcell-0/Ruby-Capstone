require './lib/genre'
require 'fileutils'
module GenreModule
  GENRE_PATH = './data/genre.json'.freeze
  def check_genre_file
    return if File.exist?(GENRE_PATH)

    FileUtils.touch(GENRE_PATH)
  end

  def write_genre_to_file(genres)
    check_genre_file
    file = File.read(GENRE_PATH)
    data = file.empty? ? [] : JSON.parse(file)
    genres.each do |genre|
      data.push(JSON.parse(genre.to_json))
    end
    File.write(GENRE_PATH, JSON.pretty_generate(data))
  end

  def create_genre(book:nil, music_album:nil, author:nil, source:nil, name:nil)
    if name.nil? || name.empty?
      raise ArgumentError, 'Invalid genre name. Please provide a valid name.'
    end
    genre = Genre.new(name)
    genre
  end

  def show_all_genres(data)
    puts 'Genres:'
    data.each do |genre|
      puts "  ID: #{genre.id}, Name: #{genre.name}"
    end
  end
end
