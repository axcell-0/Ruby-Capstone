require './lib/genre'
require './lib/music_album'
require 'json'
require './lib/genre'
require './lib/item'
require 'fileutils'
require './modules/genre_module'
require './modules/music_album_module'
require './lib/book/book'
require './lib/book/label'
require './lib/modules/add_book'
require './lib/modules/save_book_label_data'
require './lib/modules/load_book_label_data'
class App
  include GenreModule
  include MusicAlbumModule
  include NEWBOOK
  include SaveBookLabelData

  def initialize
    @books = []
    load_book_data
  def add_genre
    create_genre
  end
  def list_genre
    show_all_genres
  end
  def add_music_album
    create_music_album
  end
  def list_music_album
    show_all_music_albums
  end
end


app = App.new
app.list_music_album


