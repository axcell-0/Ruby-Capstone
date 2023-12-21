require_relative 'app'
class Main
  def initialize
    @app = App.new
  end

  def options
    puts '_____________________________________________'
    puts "Choose an option using Index Number" 
    puts "1) List all books"
    puts "2) List all music albums"
    puts "3) List all movies"
    puts "4) List of games"
    puts "5) List all genres "
    puts "6) List all labels"
    puts "7) List all authors"
    puts "8) List all sources "
    puts "9) Add a book"
    puts "10) Add a music album"
    puts "11) Add a movie"
    puts "12) Add a game"
    puts "0) Exit"
    puts "_________________________________________________"
  end

  def process_input
    puts "__________________________________"
    puts "WELCOME TO CATALOG OF MY THINGS"
    puts "___________________________________"
    loop do
      options
      print "Enter an option index (or 0 to exit): "
      option = gets.chomp.to_i

      case option
      when 1
        @app.list_books
      when 2
        @app.list_music_albums
      when 3
        @app.list_movies
      when 4
        @app.list_games
      when 5
        @app.list_genre
      when 6
        @app.list_labels
      when 7
        @app.list_authors
      when 8
        @app.list_sources
      when 9
        @app.add_book
      when 10
        @app.add_music_album
      when 11
        @app.add_movie
      when 12
        @app.add_game
      when 0
        puts "Exiting. Goodbye!"
        break
      else
        puts "Invalid option. Please choose a valid option."
      end
    end
  end

  def run 
    process_input
  end
end
main = Main.new
main.run
