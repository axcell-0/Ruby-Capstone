module GenreModule
  def write_genre_to_file(genre)
    path = './data/genre.json'
    file = File.read(path)
    data = file.empty? ? [] : JSON.parse(file)
    data.push(JSON.parse(genre.to_json))
    File.write(path, JSON.pretty_generate(data))
  end
end