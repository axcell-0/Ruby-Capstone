require './lib/genre'
require './lib/music_album'
require 'json'
require './lib/genre'
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

  def initialize
    @books = []
  end
  def add_genre
    print "Genre Name: "
    genre_name = gets.chomp
    genre = create_genre(name:genre_name)
    write_genre_to_file(genre)
  end
  def list_genre
    show_all_genres
  end
  def add_music_album
    create_music_album
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

  def test
    add_a_book
    add_all_books_to_file
  end
end

app = App.new
app.test
