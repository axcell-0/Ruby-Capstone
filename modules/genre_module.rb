require './lib/genre'
require 'fileutils'
module GenreModule
  GENRE_PATH = './data/genre.json'
  def check_genre_file
    return if File.exist?(GENRE_PATH)
    FileUtils.touch(GENRE_PATH)
  end
  
  def write_genre_to_file(genre)
    file = File.read(GENRE_PATH)
    data = file.empty? ? [] : JSON.parse(file)
    data.push(JSON.parse(genre.to_json))
    File.write(GENRE_PATH, JSON.pretty_generate(data))
  end

  def create_genre(book:nil, music_album:nil, author:nil, source:nil, name:nil)
    check_genre_file
    if name.nil? || name.empty?
      raise ArgumentError, 'Invalid genre name. Please provide a valid name.'
    end
    genre = Genre.new(name)
    genre.add_item(book) if book
    genre.add_item(music_album) if music_album
    genre.add_item(author) if author
    genre.add_item(source) if source
    return genre
  end

  # def get_all_genres_from_file
  #   return nil if !File.exist?(GENRE_PATH) || File.read(GENRE_PATH).empty?
  #   genres = []
  #   data.each do |genre|
  #   end
  #   return data = JSON.parse(File.read(GENRE_PATH))
  # end

  def show_all_genres
    if !File.exist?(GENRE_PATH) || File.read(GENRE_PATH).empty?
      puts 'No genres have been added yet'
      return
    end    
    data = JSON.parse(File.read(GENRE_PATH))
    puts 'Genres:'
    data.each do |genre|
      puts " #{genre['name']}"
    end
  end
end