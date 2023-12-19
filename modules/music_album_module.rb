require 'json'
require './modules/genre_module'
# require './modules/author_module'
# require './modules/lable_module'
require './lib/music_album'
module MusicAlbumModule
  PATH = './data/music_album.json'
  def check_music_album_file
    return if File.exist?(PATH)
    FileUtils.touch(PATH)
  end

  def get_date(prompt)
    date_format_regex = /\A\d{4}-\d{2}-\d{2}\z/
    print "#{prompt} (yyyy-mm-dd): "
    date = gets.chomp
    while !(date.match?(date_format_regex)) do
      puts 'Invalid Date Format'
      print "#{prompt} (yyyy-mm-dd): "
      date = gets.chomp
    end
    return date
  end

  def write_music_album_to_file(album)
    check_music_album_file
    file = File.read(PATH)
    data = file.empty? ? [] : JSON.parse(file)
    data.push(JSON.parse(album.to_json))
    File.write(PATH, JSON.pretty_generate(data))
  end
  def create_music_album
    publish_date = get_date('Publish Date')
    print 'Is this album on Spotify? [Y/N]: '
    on_spotify_input = gets.chomp
    on_spotify = on_spotify_input.downcase == 'y'
    album = MusicAlbum.new(publish_date, on_spotify)
    genre = create_genre
    # author = create_author
    # label = create_label
    album.save_genre = genre
    # album.save_label = label
    # album.save_author = author
    write_music_album_to_file(album)
    puts "Music Album Created Successfully"
    puts
  end
end


