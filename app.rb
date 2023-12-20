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
require './modules/load_book_label_data'
class App
  include GenreModule
  include MusicAlbumModule
  include SaveBookLabelData

  def add_genre
    genre = create_genre
  end

  def list_genre
    show_all_genres
  end

  def add_music_album
    create_music_album
  end

  def list_music_albums
    show_all_music_albums
  end

  def list_all_books
    list_books
  end

  def list_all_labels
    list_labels
  end

  def add_a_book
    book = create_book
    @books.push(book)
  end

  def add_all_books_to_file
    save_books(@books)
  end
end

app = App.new
app.add_music_album
app.list_music_albums