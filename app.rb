require './lib/genre'
require './lib/music_album'
require 'json'
require './lib/genre'
require './lib/item'
require 'fileutils'
require './modules/genre_module'
class App
  include GenreModule
  private
  def check_file(path)
    return if Dir.exist?(path)
    FileUtils.touch(path)
  end

  public
  def store_genre(genre)
    path = './data/genre.json'
    check_file(path)
    write_genre_to_file(genre)
  end
end

genre = Genre.new('Rock')
genre2 = Genre.new('pock')

genre.items.push(Item.new('2023-12-12'))
genre2.items.push(Item.new('2023-12-12'))

app = App.new
app.store_genre(genre2)
app.store_genre(genre)



