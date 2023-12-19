require './lib/genre'
module GenreModule
  PATH = './data/genre.json'
  def check_file()
    return if Dir.exist?(PATH)
    FileUtils.touch(PATH)
  end
  def write_genre_to_file(genre)
    check_file
    file = File.read(PATH)
    data = file.empty? ? [] : JSON.parse(file)
    data.push(JSON.parse(genre.to_json))
    File.write(PATH, JSON.pretty_generate(data))
  end

  def create_genre
    print 'Name of Genre: '
    name = gets.chomp
    genre = Genre.new(name)
    write_genre_to_file(genre)
    puts 'Genre Created Successfully!'
  end

  def show_all_genres
    if !File.exist?(PATH) || File.read(PATH).empty?
      puts 'No genres have been added yet'
      return
    end    
    data = JSON.parse(File.read(PATH))
    puts 'Genres:'
    data.foreach do |genre|
      " #{genre.name}"
    end
  end
end