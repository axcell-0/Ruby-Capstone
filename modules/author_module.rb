require_relative '../lib/author'
require 'json'

module AuthorModule
  def get_user_input(message)
    print message
    gets.chomp
  end

  def list_present_authors
    puts 'Listing Authors present'
    if File.exist?('data/authors.json')
      File.open('data/authors.json', 'r').each do |line|
        author_data = JSON.parse(line)
        new_author = Author.new(author_data['first_name'], author_data['last_name'])
        puts "ID: #{new_author.id}, First Name: #{new_author.first_name}, Last Name: #{new_author.last_name}"

        puts '-----------------------------------'
      end
    else
      puts 'No Authors file found!'
    end
  end

  def add_author
    puts 'Adding Author to the Record: '
    first_name = get_user_input('First Name: ')
    last_name = get_user_input('Last Name: ')
    author = Author.new(first_name, last_name)

    File.open('data/authors.json', 'a') do |file|
      file.puts author.to_json
    end

    puts '-----------------------------------'
    puts 'successfully ADDED!!'
    puts '-----------------------------------'

    author
  end
end