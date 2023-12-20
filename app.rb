require './lib/genre'
require './lib/music_album'
require 'json'
require './lib/item'
require 'fileutils'
require './modules/genre_module'
require './modules/music_album_module'
require './lib/book'
require './lib/label'
require './modules/save_book_label_data'
class App
  include GenreModule
  include MusicAlbumModule
  include SaveBookLabelData

  def list_genre
    show_all_genres
  end

  def add_music_album
    create_music_album
  end

  def list_music_albums
    show_all_music_albums
  end

  def add_a_book
    create_book
  end

  def list_all_books
    show_all_books
  end

  def list_all_labels
    list_labels
  end

  def test
    label = create_label
    save_label(label)
    show_all_labels
  end
end

app = App.new
app.test