require './lib/genre'
require './lib/music_album'
require 'json'
require './lib/genre'
require './lib/item'
require 'fileutils'
require './modules/genre_module'
class App
  include GenreModule
  def add_genre
    create_genre
  end
  def list_genre
    show_all_genres
  end
end


app = App.new
app.create_genre


