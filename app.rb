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

  def list_all_books
    list_books
  end

  def list_all_labels
    list_labels
  end

  def add_a_book
    puts 'Enter the book\'s publish date (YYYY-MM-DD):'
    date = gets.chomp
    puts 'Enter the book\'s publisher:'
    publisher = gets.chomp
    puts "Select label:\n1. Gift\n2. New\n"
    label_choice = gets.chomp.to_i
    puts 'Enter the book\'s label color:'
    label_color = gets.chomp
    print "Select cover state: \n1. Good \n2. Bad\n"
    cover_state_choice = gets.chomp.to_i
    add_new_book(date, publisher, cover_state_choice, label_choice, label_color)
  end
end


app = App.new
app.add_music_album