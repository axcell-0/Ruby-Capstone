require_relative '../lib/game'
require_relative 'author_module'
require_relative 'save_book_label_data'
require_relative 'genre_module'
require 'json'

module GameModule
  include AuthorModule

  def get_user_input(message)
    print message
    gets.chomp
  end

  def check_game_file
    return if File.exist?('data/games.json')

    FileUtils.touch('data/games.json')
  end

  def list_all_games
    puts 'Games:'
    if File.exist?('data/games.json') && !File.empty?('data/games.json')
      data = JSON.parse(File.read('data/games.json'))
      data.each do |game|
        puts "  ID: #{game['id']}, Multiplayer: #{game['multiplayer']}, Last Played: #{game['last_played_at']}"
        puts "  Last Played: #{game['last_played_at']}, Publish Date: #{game['publish_date']}"
        puts '  _________________________________________________'
      end
    else
      puts 'There is no Games yet!'
    end
  end

  def create_game
    check_game_file
    file = File.read('data/games.json')
    puts 'Creating a Game Record: '
    multiplayer = get_user_input('Multiplayer[Y/N]: ').casecmp('Y').zero?
    last_played_at = get_user_input('Last played(yyyy-mm-dd): ')
    publish_date = get_user_input('Game publish date(yyyy-mm-dd): ')
    label = create_label
    genre = create_genre
    author = create_author

    game = Game.new(multiplayer, last_played_at, publish_date)
    label.add_item(game)
    genre.add_item(game)
    author.add_item(game)
    data = file.empty? ? [] : JSON.parse(file)
    data.push(game.to_json)
    File.write('data/games.json', JSON.pretty_generate(data))
    puts 'Game Added Successfully!'
  end
end
