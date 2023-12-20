require 'json'
require_relative 'music_album_module'
require_relative 'genre_module'
require './lib/book'
require './lib/label'

# Module to preserve data
module SaveBookLabelData
  BOOK_FILE = './data/book.json'.freeze
  LABEL_FILE = './data/label.json'.freeze
  def check_book_file
    return if File.exist?(BOOK_FILE)
    FileUtils.touch(BOOK_FILE)
  end
  def check_label_file
    return if File.exist?(LABEL_FILE)
    FileUtils.touch(LABEL_FILE)
  end

  def save_label(label)
    check_label_file
    file = File.read(LABEL_FILE)
    data = file.empty? ? [] : JSON.parse(file)
    data.push(JSON.parse(label.to_json))
    File.write(LABEL_FILE, JSON.pretty_generate(data))
  end

  def create_label
    print "Label Color: "
    color = gets.chomp
    print "Label Title: "
    title = gets.chomp
    label = Label.new(title, color)
    save_label(label)
    return label
  end

  def save_book(book)
    check_book_file
    file = File.read(BOOK_FILE)
    data = file.empty? ? [] : JSON.parse(file)
    data.push(JSON.parse(book.to_json))
    File.write(BOOK_FILE, JSON.pretty_generate(data))
  end

  def show_all_labels
    if File.read(LABEL_FILE).empty? || !File.exist?(LABEL_FILE)
      puts "No Labels have been added yet"
    end
    data = JSON.parse(File.read(LABEL_FILE))
    puts 'Labels:'
    data.each do |label|
      puts "  ID: #{label['id']}, title: #{label['title']}, Color: #{label['color']}"
    end
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
    genre.add_item(book)
    save_book(book)
    puts 'Book Created Successfully'
  end

  def show_all_books
    if !File.exist?(BOOK_FILE) || File.empty?(BOOK_FILE)
      puts 'No Albums have been added yet'
      return
    end
    puts 'Books:'
    data = JSON.parse(File.read(BOOK_FILE))
    data.each do |book|
      puts "  ID: #{book['id']}, Publisher #{book['publisher']}, Publish_date: #{book['publish_date']}, Genre: #{book['genre']['name']}"
    end
  end
end
