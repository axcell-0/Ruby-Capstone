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
require './modules/author_module'
require './modules/game_module'
require './modules/movie_module'
class App
  include GenreModule
  include MusicAlbumModule
  include SaveBookLabelData
  include AuthorModule
  include GameModule
  include MovieModule
  include SourceModule

  def list_genre
    show_all_genres
  end

  def list_music_albums
    show_all_music_albums
  end

  def list_books
    show_all_books
  end

  def list_labels
    show_all_labels
  end

  def list_games
    list_all_games
  end

  def list_authors
    list_present_authors
  end

  def list_movies
    list_all_movies
  end

  def add_music_album
    create_music_album
  end

  def add_book
    create_book
  end

  def add_game
    create_game
  end

  def add_movie
    add_a_movie
  end
end

app = App.new
app.add_movie
