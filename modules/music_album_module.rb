require 'json'
require './modules/genre_module'
# require './modules/author_module'
# require './modules/lable_module'
require './lib/music_album'
module MusicAlbumModule
  ALBUM_PATH = './data/music_album.json'.freeze
  def check_music_album_file
    return if File.exist?(ALBUM_PATH)

    FileUtils.touch(ALBUM_PATH)
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

  def write_music_album_to_file(album)
    check_music_album_file
    file = File.read(ALBUM_PATH)
    data = file.empty? ? [] : JSON.parse(file)
    data.push(JSON.parse(album.to_json))
    File.write(ALBUM_PATH, JSON.pretty_generate(data))
  end

  def create_music_album
    publish_date = get_date
    print 'Is this album on Spotify? [Y/N]: '
    on_spotify_input = gets.chomp
    on_spotify = on_spotify_input.downcase == 'y'
    album = MusicAlbum.new(publish_date, on_spotify)
    genre = create_genre
    genre.add_item(album)
    # author = create_author
    # label = create_label
    write_music_album_to_file(album)
    puts 'Music Album Created Successfully'
    puts
  end

  def show_all_music_albums
    if !File.exist?(ALBUM_PATH) || File.empty?(ALBUM_PATH)
      puts 'No Albums have been added yet'
      return
    end
    puts 'Music Album:'
    data = JSON.parse(File.read(ALBUM_PATH))
    data.each do |album|
      puts "  ID: #{album['id']}, Publish_date: #{album['publish_date']} Genre: #{album['genre']['name']}, on_spotify: #{album['on_spotify']}"
    end
  end
end
