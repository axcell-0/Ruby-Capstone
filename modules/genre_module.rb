require './lib/genre'
require 'fileutils'
module GenreModule
  GENRE_PATH = './data/genre.json'.freeze
  def check_genre_file
    return if File.exist?(GENRE_PATH)

    FileUtils.touch(GENRE_PATH)
  end

  def write_genre_to_file(genre)
    check_genre_file
    file = File.read(GENRE_PATH)
    data = file.empty? ? [] : JSON.parse(file)
    data.push(JSON.parse(genre.to_json))
    File.write(GENRE_PATH, JSON.pretty_generate(data))
  end

  def create_genre
    print 'Genre Name:'
    name = gets.chomp
    genre = Genre.new(name)
    write_genre_to_file(genre)
    genre
  end

  def show_all_genres
    if !File.exist?(GENRE_PATH) || File.empty?(GENRE_PATH)
      puts 'No genres have been added yet'
      return
    end
    data = JSON.parse(File.read(GENRE_PATH))
    puts 'Genres:'
    data.each do |genre|
      puts "  ID: #{genre['id']}, Name: #{genre['name']}"
    end
  end
end
