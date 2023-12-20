require 'json'
require_relative './music_album_module'
require_relative './genre_module'
require './lib/book'

# Module to preserve data
module SaveBookLabelData
  BOOK_FILE = './data/book.json'.freeze
  LABEL_FILE = './data/label.json'.freeze
  def check_book_file
    return if File.exist?(BOOK_FILE)
    FileUtils.touch(BOOK_FILE)
  end

  def save_label
  end

  def save_books(books)
    check_book_file
    file = File.read(BOOK_FILE)
    data = file.empty? ? [] : JSON.parse(file)
    books.each do |book|
      data.push(JSON.parse(book.to_json))
    end
    File.write(BOOK_FILE, JSON.pretty_generate(data))
  end

  def create_book
    date = get_date
    print 'Publisher Name: '
    publisher = gets.chomp
    puts 'Select Cover State by number:'
    puts '  1) Good'
    puts '  2) Bad'
    cover_state_input = gets.chomp
    cover_state = cover_state_input == '1' ? 'Good' : 'Bad'
    book = Book.new(date, publisher, cover_state)
    genre = create_genre
    book.save_genre = genre
    puts 'Book Created Successfully'
    puts book
    return book
  end
end
