# frozen_string_literal: true

class App
  def create_movie
    puts 'You have selected 11 - Create a movie'
    title = get_user_input('Enter movie title: ')
    silet = get_user_input('Is it silent? (true/false): ').downcase == 'true'
    genre = get_user_input('Enter movie genre: ')
    author_first_name = get_user_input('Enter author first name: ')
    author_last_name = get_user_input('Enter author last name: ')
    source_name = get_user_input('Enter source name: ')
    label = get_user_input('Enter label: ')
    publish_date = Date.parse(get_user_input('Enter publish date (YYYY-MM-DD): '))

    @movies << Movie.new(title, silet, genre, label, publish_date)
    @authors << Author.new(author_first_name, author_last_name)
    @sources << Source.new(source_name)

    print @movies
    save_file(@movies, './data-files/movies.json')
    save_file(@authors, './data-files/authors.json')
    save_file(@sources, './data-files/sources.json')
    @sources = read_file('./data-files/sources.json')
    @movies = read_file('./data-files/movies.json')

    puts "Movie '#{title}' created successfully"
  end

  # list all movies method
  def list_all_movies_method
    @movies.each do |movie|
      puts "Title: #{movie['title']}, Silent: #{movie['silet']}, Genre: #{movie['genre']}, ..."
      puts '------------------------------'
    end
  end
end
