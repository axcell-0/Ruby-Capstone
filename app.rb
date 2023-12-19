require './lib/genre'
require './lib/music_album'
require 'json'
require './lib/genre'
require './lib/item'
require 'fileutils'
require './modules/genre_module'
require './modules/music_album_module'
class App
  include GenreModule
  include MusicAlbumModule
  def add_genre
    create_genre
  end
  def list_genre
    show_all_genres
  end
  def add_music_album
    create_music_album
  end
end


app = App.new
app.add_music_album


