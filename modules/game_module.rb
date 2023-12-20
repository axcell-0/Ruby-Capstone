require_relative '../lib/game'
require_relative 'author_module'
require_relative 'load_book_label_data'
require_relative 'genre_module'
require 'json'

module GameModule
  include AuthorModule

  def get_user_input(message)
    print message
    gets.chomp
  end

  def list_games
    if File.exist?('data/games.json')
      File.open('data/games.json', 'r').each do |line|
        game_data = JSON.parse(line)
        new_game = Game.new(game_data['multiplayer'], game_data['last_played_at'], game_data['publish_date'])
        print "ID: #{new_game.id} Multiplayer: #{new_game.multiplayer} "
        puts "last_played: #{new_game.last_played_at}, Game Published: #{new_game.publish_date}"
        puts '-----------------------------------'
      end
    else
      puts 'There is no Games yet!'
    end
  end

  def create_game
    puts 'Creating a Game Record: '
    multiplayer = get_user_input('Multiplayer[Y/N]: ').casecmp('Y').zero?
    last_played_at = get_user_input('Last played(yyyy-mm-dd): ')
    publish_date = get_user_input('Game publish date(yyyy-mm-dd): ')
    label = create_label
    genre = creating_genre
    author = add_author

    game = Game.new(multiplayer, last_played_at, publish_date)
    game.label = label
    game.genre = genre
    game.author = author

    File.open('data/games.json', 'a') do |file|
      file.puts game.to_json
    end
    puts 'Game Added Successfully!'
  end
end
