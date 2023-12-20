require 'json'
require './modules/genre_module'
# require './modules/author_module'
# require './modules/lable_module'
require './lib/music_album'
module MusicAlbumModule
  ALBUM_PATH = './data/music_album.json'
  def check_music_album_file
    return if File.exist?(ALBUM_PATH)
    FileUtils.touch(ALBUM_PATH)
  end

  def get_date
    date_format_regex = /\A\d{4}-\d{2}-\d{2}\z/
    print "Publish Date (yyyy-mm-dd): "
    date = gets.chomp
    while !(date.match?(date_format_regex)) do
      puts 'Invalid Date Format'
      print "Publish Date (yyyy-mm-dd): "
      date = gets.chomp
    end
    return date
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
    print 'Genre name: '
    genre_name = gets.chomp
    genre = create_genre(name:genre_name, music_album:album)
    write_genre_to_file(genre)
    # author = create_author
    # label = create_label
    write_music_album_to_file(album)
    puts "Music Album Created Successfully"
    puts
  end

  def show_all_music_albums
    if !File.exist?(ALBUM_PATH) || File.read(ALBUM_PATH).empty?
      puts 'No Albums have been added yet'
      return
    end
      puts "Music Album:"
      data = JSON.parse(File.read(ALBUM_PATH))
      data.each do |album|
        puts "  ID: #{album["id"]}, Publish_date: #{album["publish_date"]} Genre: #{album["genre"]["name"]}, on_spotify: #{album["on_spotify"]}"
      end
  end
end


